# Importing Libraries
import numpy as np
import cv2
import os
import scipy
from scipy.cluster.hierarchy import dendrogram, linkage, fcluster
from scipy.spatial.distance import pdist
import matplotlib.pyplot as plt

# Loading Images
def load_images(folder):
    images = []
    for filename in os.listdir(folder): 
        img = cv2.imread(os.path.join(folder, filename), cv2.IMREAD_ANYDEPTH)
        if img is not None:
            images.append(img)
    return images

# Loading Actual & Simulated Photos:
car_photos = load_images('/Users/anniem/HCABlackHoles/ProgramTestData/Cars') 
face_photos = load_images('/Users/anniem/HCABlackHoles/ProgramTestData/Faces') 

all_photos = car_photos + face_photos

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

# Computing Distance Matrix (Euclidean Distance)
distance_matrix = pdist(features, metric='euclidean')

# Hierarchical Clustering (Ward's Linkage Method)
Z = linkage(distance_matrix, method='ward')

# Dendogram
plt.figure(figsize = (10, 7))
plt.title('Dendogram for Face and Car Photos') 
dendrogram(Z)
plt.show()

# Cluster Analysis
# Cutting the dendrogram at a specific height to form clusters:
max_d = 50
clusters = fcluster(Z, max_d, criterion = 'distance')

# Determine Clusters and Assign Labels
num_clusters = 2
clusters = fcluster(Z, num_clusters, criterion='maxclust')

# Print Cluster Assignments
for i, cluster_label in enumerate(clusters):
    if i < len(car_photos):
        print(f'Car photo {i} is in cluster {cluster_label}.')
    else:
        print(f'Face photo {i - len(car_photos)} is in cluster {cluster_label}.')

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

