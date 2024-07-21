## Workflow Breakdown

[This code](https://github.com/annadmitrieff/Classwork-and-Notes/tree/main/FALL%2024/RESEARCH/DR.%20HALL%20RESEARCH/Code/SampleProgram) is just an example of applying HCA to a very simplistic dataset. Future work enlists compatibility with data received from WEBB/Chandra & PHANTOM.

I'm still not certain what form it may be in (image data, FITS files, 3D data cubes, ASN, CSV, Pipeline Data Products) or what additional tools may be beneficial for analysis (e.g. SAOImageDS9 for FITS files), CIAO, or the JWST Calibration Pipeline.

```
# Importing Libraries
import numpy as np
import cv2
import os
import scipy
from scipy.cluster.hierarchy import dendrogram, linkage, fcluster
from scipy.spatial.distance import pdist
import matplotlib.pyplot as plt
```

1. **NumPy**:
     - **NumPy** is a library which works with large, multi-dimensional arrays and matrices.
     - We are using NumPy for converting image features into arrays, as well as performing numerical operations in handling these feature arrays.
     - An **array** is a data structure used to store a collection of elements, typically of the same type, in a contiguous block of memory. Arrays provide a way to organize and manipulate data efficiently.
     - **Feature arrays** are a type of array that represent the features or attributes of data points in a structured format. They encode information about data points in a format that can be used by machine learning algorithms or statistical methods.
       - They typically are structured as a 2D array where each row represents a single data point, and each column represents a feature or attribute of that data point.
       - For example, in a dataset of images, each image might be represented as a vector of features extracted from the image, such as color histograms, texture descriptors, or HOG features.

2. **OpenCV (cv2)**:
    - **OpenCV** is a computer vision and machine learning library which performs a wide range of image and video processing tasks.
    - We are using OpenCV for reading images from files, resizing images to a uniform size, and computing HOG (Histogram of Oriented Gradients) features from images.
      - **HOG** is a feature descriptor used in computer vision and image processing for object detection.  It focuses on the structure or the shape of an object in an image.
      - HOG features are particularly effective for object detection tasks, such as pedestrian detection, due to their ability to capture edge or gradient structure that is characteristic of local shapes.
      - Key steps in HOG are as follows:
     
        1. **Gradient Computation:**
           - Compute the gradient/change in intensity for each pixel in the image, highlighting regions of the image with high contrast (such as edges). Typically, gradients in the x- and y- directions are calculated using simple filters like the Sobel Operator.
        2. **Orientation Binning**:
            - Divide the image into small spatial regions ('cells,' which are 8x8 pixels).
            - For each cell, create a histogram of gradient orientations (angles) weighted by the gradient magnitude, capturing the distribution of edge directions within the cell.
            - The gradient orientations are typically binned into predefined bins (e.g. 9 bins covering 0 to 180 degrees).
        3. **Block Normalization**:
            - Group adjacent cells into larger spatial regions ('blocks,' which are 2x2 cells).
            - Normalize the histograms within each block to account for changes in illumination and contrast, typically done by computing a norm (e.g. an L2 norm) of each of the histograms within the block and scaling them accordingly.
            - This step ensures that the descriptor is robust to lightning variations.
        4. **Descriptor Construction**:
            - Concatenate the normalized histograms from all blocks in the image to form the final feature vector, which is the HOG descriptor.
            - The resulting descriptor represents the local shape information of the object in the image.

3. **os**:
    - **os** is a library which interacts with the operating system for file and directory operations.
    - os lists files in a directory and constructs file paths.

4. **SciPy**:
    - **SciPy** is a library utilized for scientific and technical computing.
    - We are using SciPy submodules for performing hierarchical clustering, generating dendrograms, and computing distance matrices.
    - **Distance matrices** are two-dimensional arrays (or matrices) that contain the distances between pairs of elements in a dataset" each element in the matrix represents the distance (or dissimilarity) between two points (or objects).
        -  Distance matrices are typically symmetric.
        -  The diagonal elements of a distance matrix are zero (as distance from any point to itself is zero).
        -  Various distance metrics can be used to calculate the distances between two points:
            1. **Euclidean Distance** defines the straight-line distance between two points in Euclidean space.
            2. **Manhattan Distance** is the sum of the absolute differences of points' coordinates.
            3. **Cosine Distance** is the measure of the cosine of the angle between two vectors.
            4. **Minkowski Distance** is the generalized form of Euclidean and Manhattan distances.  

5. **Matplotlib**:
    - **Matplotlib** is a library used for creating static, animated, and interactive visualizations of data.
    - We are using Matplotlib to plot out dendrogram visualizing the hierarchical clustering process, and to display clustered images in subplots to inspect clustering results.

```
# Loading Images
def load_images(folder):
    images = []
    for filename in os.listdir(folder): 
        img = cv2.imread(os.path.join(folder, filename), cv2.IMREAD_ANYDEPTH)
        if img is not None:
            images.append(img)
    return images
```
This function bach loads all image files from a directory into a list, making for easy processing of multiple images at once in subsequent steps.

- `def load_images(folder):` defines a function to load images from a specific folder.
- `images = []` initializes an empty list to store the loaded images.
- `for filename in os.listdir(folder):` loops through each file in the specified folder.
- `img = cv2.imread(os.path.join(folder, filename), cv2.IMREAD_ANYDEPTH)` reads each file as an image:
     - `os.path.join(folder, filename):` constructs the full path to the file by joining the folder path and the filename.
     - `cv2.IMREAD_ANYDEPTH` is a flag which allows the function to read images with any bit depth (e.g. 8-bit, 16-bit).
- `if img is not None:` ensures image validity by ensuring that the image was successfully loaded. If `cv2.imread` fails to read the image (e.g. if the file is not an image), it returns `None`.
- `images.append(img)` adds the valid image to the list.
- `return images` returns the list of loaded images. 

```
# Loading Actual & Simulated Photos:
car_photos = load_images('/Users/anniem/HCABlackHoles/ProgramTestData/Cars') 
face_photos = load_images('/Users/anniem/HCABlackHoles/ProgramTestData/Faces') 

all_photos = car_photos + face_photos
```
This subsection prepares our dataset by loading images from specified directories and combining them into a single list.
- The variable `car_photos` is defined by calling the `load_images` function, passing the directory path for the photos of cars as the argument; the returned list of images is assigned to the variable `car_photos`.
- The variable `face_photos` is defined by calling the `load_images` function, passing the directory path for the photos of faces as the argument; the returned list of images is assigned to the variable `face_photos`.
- `all_photos` is defined by the concatenation of two lists, `car_photos` and `face_photos`.

```
# Feature Extraction 
def extract_features(images, size=(64, 64)):
    features = []
    win_size = size
    block_size = (16, 16)
    block_stride = (8, 8)
    cell_size = (8, 8)
    nbins = 9
    
    hog = cv2.HOGDescriptor(_winSize=win_size,
                            _blockSize=block_size,
                            _blockStride=block_stride,
                            _cellSize=cell_size,
                            _nbins=nbins)
    
    for idx, img in enumerate(images):
        resized_img = cv2.resize(img, win_size)
        hog_features = hog.compute(resized_img).flatten()
        features.append(hog_features)
        
        # Debug: Print shape and first few elements of features
        if idx < 5:  # Print for the first few images
            print(f"Image {idx} HOG features shape: {hog_features.shape}")
            print(f"Image {idx} HOG features sample: {hog_features[:5]}")

    return np.array(features)

features = extract_features(all_photos)
```
This function extracts meaningful features from images which can later be used to create clusters.
- `extract_features(images, size(64, 64))` defines a function which takes two arguments, image and size, that extracts features from a list of images, resizing them to a specified size.
- `features = []` initializes an empty list that will be used to store the extracted features from each image.
- `win_size`, `block_size`, `block_stride`, `cell_size`, and `nbins` are Histogram of Oriented Gradients (HOG) descriptors--these lines set various HOG descriptor parameters:
     - `win_size` is the size of the window (region of the image) to be processed at once.
     - `block_size` is the size of each block (a group of cells) within the window.
     - `block_stride` is the distance between adjacent blocks.
     - `cell_size` is the size of each cell within a block.
     - `nbins` is the number of bins for the histogram of gradient orientations.
- `hog` initializes the HOG descriptor object, which will be used to compute the HOG features for each image, with the specified parameters.
- `for idx, img in enumerate(images):` initiates a loop that iterates over each image in the `images` list.
     - `idx` is the index of the image.
     - `img` is the image itself.
- `resized_img` calls the `cv2.resize` function to resize the current image (`img`) to the specified `win_size`--in this case, the default size, `(64, 64)`.
- `hog_features` calls the `hog.compute` function to compute the HOG features for the resized image using the HOG descriptor object, extracting HOG features from the image which are used for capturing edge and gradient information.
     - The `flatten()` method is called to convert the HOG features into a 1D array.  
- `features.append(hog_features)` appends the extracted HOG features to `features`, collecting the features for each image into a single list.
- The conditional `if idx < 5:` prints the shape and a sample of the HOG features for the first few images (up to 5), verifying that the feature extraction is working correctly and that HOG features are being computed as expected.
- `return np.array(features)` converts the list of HOG features, `features`, to a NumPy array and returns it.
- `features = extract_features(all_photos)` calls the `extract_features` function with `all_photos` as the argument and assigns the returned NumPy array to the `features` variable for further processing.

```
# Computing Distance Matrix (Euclidean Distance)
distance_matrix = pdist(features, metric='euclidean')
```
This subsection computes the pairwise distances between the feature vectors of images as a measure of dissimilarity or distance between data points.
- The line `distance_matrix` calls the `pdist` function from the `scipy.spatial.distance` module.
- `pdist(features, metric='euclidean')` computes the pairwise distances between observations in the `features` array using the Euclidean distance metric.
     - Recall that `features` defines the 2D NumPy array where each row represents the feature vector of an image.
     - `metric='euclidean` specifies that the Euclidean distance should be used to calculate the distances.  
- `pdist` returns a condensed distance matrix, which is a 1D array containing the upper triangular distances of the 2D distance matrix (excluding the diagonal), which is assigned to the variable `distance_matrix`.
     - A condensed distance matrix has several advantages in terms of efficiency and storage.
     - Since distance matrices are symmetric and the diagonal elements are zero, storing only the upper triangular part avoids redundancy and saves memory, requiring $\dfrac{n(n-1)}{2}$ elements for the $n$ elements in full distance matrices.
     - Some algorithms and functions, such as those in SciPy, are optimized to work directly with condensed distance matrices. 

```
# Hierarchical Clustering (Ward's Linkage Method)
Z = linkage(distance_matrix, method='ward')
```
This subsection performs hierarchical clustering to create a cluster tree that can be used to visualize and analyze the hierarchical relationships between our sample data points.
- `Z = linkage(distance_matrix, method='ward')` calls the `linkage` function from the `scipy.cluster.hierarchy` module to perform hierarchical clustering on the distance matrix using Ward's linkage method.
     - Recall that `distance_matrix` is the precomputed condensed distance matrix from above containing pairwise distances between data points, crucial in providing the distance information necessary for clustering.
     - `method='ward'` defines the linkage method as Ward's Linkage Method, a linkage criterion that minimizes variance within clusters.
          - The purpose is to create clusters that minimize the sum of squared distances within all clusters.
          - This method tends to produce clusters of relatively equal size and compactness.  
- `Z` is defined as a linkage matrix that encodes the hierarchical clustering, containing information about the clustering hierarchy and the distances between clusters at each step.
     - The linkage matrix `Z` has shape `(n-1, 4)`, with `n` being the number of original observations.
          - Column 1 is the index of the first cluster being merged.
          - Column 2 is the index of the second cluster being merged.
          - Column 3 is the distance between the merged clusters.
          - Column 4 is the number of original observations in the newly formed cluster. 

```
# Dendogram
plt.figure(figsize = (10, 7))
plt.title('Dendogram for Face and Car Photos') 
dendrogram(Z)
plt.show()
```

```
# Cluster Analysis
# *Cutting the dendrogram at a specific height to form clusters:
max_d = 10 # !POSSIBLY ADJUST BASED ON VALUE OF DENDROGRAM
clusters = fcluster(Z, max_d, criterion = 'distance')
```

```
# Determine Clusters and Assign Labels #? NEW ADDITION
num_clusters = 2
clusters = fcluster(Z, num_clusters, criterion='maxclust')
```

```
# Analyze Clusters
# *Need to plan further--group photos by cluster labels and compare actual vs. simulated photos?
```

```
# Print Cluster Assignments
for i, cluster_label in enumerate(clusters):
    if i < len(car_photos):
        print(f'Car photo {i} is in cluster {cluster_label}.')
    else:
        print(f'Face photo {i - len(car_photos)} is in cluster {cluster_label}.')
```

```
# Plotting Cluster Images # ?NEW ADDITION
def plot_clusters(images, clusters, n_clusters):
    cluster_dict = {i: [] for i in range(1, n_clusters + 1)}
    for idx, cluster_label in enumerate(clusters):
        cluster_dict[cluster_label].append(images[idx])

    fig, axes = plt.subplots(n_clusters, len(images)//n_clusters, figsize=(10, 5))
    for cluster_label, cluster_images in cluster_dict.items():
        for i, ax in enumerate(axes[cluster_label - 1]):
            if i < len(cluster_images):
                ax.imshow(cluster_images[i], cmap='gray')
                ax.set_title(f'Cluster {cluster_label}')
            ax.axis('off')
    plt.tight_layout()
    plt.show()

plot_clusters(all_photos, clusters, num_clusters)
```

## Vocabulary
Array
Feature Array
HOG
