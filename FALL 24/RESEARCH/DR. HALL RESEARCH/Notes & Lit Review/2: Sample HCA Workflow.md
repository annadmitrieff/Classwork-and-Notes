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
car_photos = load_images('/Users/.../ProgramTestData/Cars') # Path to Car Dataset
face_photos = load_images('/Users/.../ProgramTestData/Faces') # Path to Face Dataset

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
This subsection visualizes the results of hierarchical clustering using a dendogram, which is beneficial for understanding the hierarchical relationships between the data points and how clusters are formed and merged.
- `plt.figure(figsize = (10, 7))` calls the Matplotlib `plt.figure` function to plot the dendogram, taking input parameters that specify the size of the figure in inches (width = 10" and height = 7").
- `plt.title('Dendogram for Face and Car Photos')` calls the Matplotlib `plt.title` to set the title of the plot.
- `dendrogram(Z)` creates the dendrogram using the `dendrogram` function from the `scipy.cluster.hierarchy` module using the linkage matrix obtained from the hierarchical clustering step.
- `plt.show` displays the plot using the respective Matplotlib function.

![Dendrogram](https://github.com/user-attachments/assets/c0bf79e0-94f6-49e5-a690-c02af94adaa7)

```
# Cluster Analysis
# Cutting the dendrogram at a specific height to form clusters:
max_d = 50 
clusters = fcluster(Z, max_d, criterion = 'distance')
```
This subsection determines the clusters by cutting the dendrogram at a specified height, resulting in a flat clustering of the data points, allowing control over the maximum distance between clusters.
- `max_d = 50` defines the height of the dendrogram, which determines the threshold distance for forming clusters: in other words, the maximum distance between clusters for data to be considered part of the same cluster.
     - A higher distance threshold allows for more distant points to be included in the same cluster. This means that fewer cuts are made in the dendrogram, resulting in larger clusters and thus fewer overall clusters: the cut line is higher up in the dendrogram, which means that clusters are allowed to join at a higher distance. This results in fewer, larger clusters.
     - A lower distance threshold means that only points very close to each other will be included in the same cluster. This results in more cuts in the dendrogram, leading to smaller clusters and thus more clusters: the cut line is lower in the dendrogram, meaning that clusters are only formed by very close points. This results in more, smaller clusters.
- `clusters` calls the function `fcluster` from the `scipy.cluster.hierarchy` module to form flat clusters by cutting the dendrogram.
     - `fcluster` takes the inputs `Z`, `max_d`, and `criterion` to generate a list of cluster labels for each data point based on the specified distance criterion.
          - `Z` is the linkage matrix obtained from the hierarchical clustering step.
          - `max_d` is the threshold distance for forming clusters.
          - `criterion='distance':` specifies that clusters should be formed by cutting the dendrogram at the given max_d distance.
     - `fcluster` returns an array where each element is the cluster label assigned to the corresponding data point.

```
# Determine Clusters and Assign Labels
num_clusters = 2
clusters = fcluster(Z, num_clusters, criterion='maxclust')
```
This section determines the clusters by specifying the desired number of clusters, allowing the user to define the number of clusters formed, which can be useful when you have a specific requirement or expectation for the number of clusters.
- The variable `num_clusters` is set to 2, for the 2 expected clusters we aim to produce (cars and faces).
- `clusters` calls the `scipy` function `fcluster` to form flat clusters from the hierarchical clustering.
     - `fcluster` takes the same input `Z` as well as `num_clusters` and `criterion`.
          - `num_clusters` describes the number of clusters to form.
          - `criterion='maxclust` specifies that exactly n = `num_clusters` clusters should form.
     - This produces an array of cluster labels, where each label corresponds to a cluster assignment for a data point.
          - Because we have 6 datapoints and 2 designated clusters, the `clusters` array may look like `[1, 1, 1, 2, 2, 2]`, indicating the cluster membership of each point. 

```
# Print Cluster Assignments
for i, cluster_label in enumerate(clusters):
    if i < len(car_photos):
        print(f'Car photo {i} is in cluster {cluster_label}.')
    else:
        print(f'Face photo {i - len(car_photos)} is in cluster {cluster_label}.')
```
This conditional prints the cluster assignments for each image, differentiating between car photos and face photos:
- The `for` statement starts a loop that iterates over each element in the `clusters` array. The variable `i` is the index, and `cluster_label` is the cluster label assigned to the `i`-th image.
     - `enumerate(clusters):` generates pairs of index and cluster label for each element in the clusters array.
- The `if` statement checks if the index `i` is less than the length of `car_photos` to determine whether the current image is a photo of a car or a face based on its position in the combined `all_photos` list.
     - `len(car_photos):` is the number of car photos. If `i` is less than this value, it indicates that the current image is a car photo.
- `print(f'Car photo {i} is in cluster {cluster_label}.')` prints a message indicating the index of the car photo (if the current image is a car photo) and the cluster it belongs to, using an f-string to format the message, including the index `i` and the cluster label `cluster_label`.
- The `else` clause indicates the start of an alternative action if the condition `i < len(car_photos)` is not met, handling the case where the current image is not a car photo (i.e., it is a face photo).
- The statement `print(f'Face photo {i - len(car_photos)} is in cluster {cluster_label}.')` prints a message indicating the index of the face photo and the cluster it belongs to using an f-string to format the message, including an adjusted index and the cluster label `cluster_label`.
     - The statement uses `i - len(car_photos)` to adjust the index for face photos, since face photos come after car photos in the combined `all_photos` list. 

> Car photo 0 is in cluster 2.

> Car photo 1 is in cluster 2.

> Car photo 2 is in cluster 2.

> Face photo 0 is in cluster 1.

> Face photo 1 is in cluster 1.

> Face photo 2 is in cluster 1.

```
# Plotting Cluster Images
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
This subsection verifies the cluster assignments by plotting the images grouped by their clusters. 
- `def plot_clusters(images, clusters, n_clusters):` defines a function that takes three arguments, `images`, `clusters`, and `n_clusters`, to create a function that will plot images grouped by their cluster assignments.
- The variable `cluster_dict` initializes a dictionary, `cluster_dict` where the keys are cluster labels and the values are empty lists, in order to prepare a structure for storing images grouped by their cluster assignments.
- The loop `for idx, cluster_label in enumerate(clusters):` loops through each image index and its corresponding label.
     - The succeeding line `cluster_dict[cluster_label].append(images[idx])` appends the image to the appropriate list in `cluster_dict` to group images by their cluster assignments.
- `fig, axes = plt.subplots(n_clusters, len(images)//n_clusters, figsize=(10, 5))` line creates a figure and a grid of subplots using Matplotlib's `plt.subplots()` function, accepting the inputs:
     - `n_clusters` is the number of rows (one for each cluster).
     - `len(images)//n_clusters` is the number of columns (distributing images evenly across rows), determined using floor division of the number of images by the number of clusters in which the images are grouped (\dfrac{6}{2} = 3).
     - `figsize=(10, 5)` specifies the size of the figure.
- `for cluster_label, cluster_images in cluster_dict.items():` starts a loop that iterates over each cluster label and its corresponding list of images in order to process each cluster separately.
- `for i, ax in enumerate(axes[cluster_label - 1]):` loops through the images in each cluster for every `i` (index of the current subplot in the iteration) and `ax` (current axis object/subplot in the iteration).
     - `enumerate(axes[cluster_label - 1]):` iterates through the subplots for the current cluster.
     -  `if i < len(cluster_images):` checks if there are still images to plot for the current cluster.
     -  `ax.imshow(cluster_images[i], cmap='gray')` displays the image `i` in grayscale.
     -  `ax.set_title(f'Cluster {cluster_label}')` sets the title of the subplot to indicate the cluster label.
     -  `ax.axis('off'):` turns off the axis labels (aesthetic choice).
- `plt.tight_layout()` adjusts the layout of the subplots to prevent overlap and display the figure (another aesthetic choice).
- `plt.show()` displays the figure.
- `plot_clusters(all_photos, clusters, num_clusters)` calls the `plot_clusters` function with `all_photos`, `clusters`, and `num_clusters` as arguments to execute the function and plot the images grouped by their cluster assignments.

![Clustering](https://github.com/user-attachments/assets/9e8c0c39-7986-48d1-8777-73da3e29c640)
