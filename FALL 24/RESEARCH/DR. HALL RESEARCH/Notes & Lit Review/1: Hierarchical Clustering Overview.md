## What is Hierarchical Clustering?

Hierarchical Clustering (also known as Hierarchical Cluster Analysis, or HCA) is a method of cluster analysis that builds a hierarchy of clusters. Clustering is the task of grouping a set of objects in such a way that objects in each group are more similar to each-other than to those in other groups, or clusters.

HCA strategies generally fall into two categories.

- **Agglomerative**: A bottom-up approach in which each observation starts in its own cluster, and a pair of clusters are merged as one moves up the hierarchy.
- **Divisive**: A top-down approach in which all observations start in one cluster, and splits are performed recursively as one moves down the hierarchy.

Merges and splits are determined in a greedy algorithmic manner: that is, they utilize algorithms that make locally optimal choices at each stage. Results can be presented in a dendrogram.

![greedy algorithm](https://github.com/user-attachments/assets/0478b5ff-39e4-46bc-a61f-dbd8e514fed0)

*Source: Wikipedia*

Hierarchical clustering is highly flexible because it can work with any valid measure of distance: you can choose any distance metric (Euclidean, Manhattan, Cosine, etc.) based on the nature of your data and the specific requirements of your analysis.

The algorithm does not require the original data points themselves, only the matrix of distances between them. This can be particularly useful if the original data is complex or high-dimensional, but the distances can be easily computed.


## Optimality of Clustering Solutions

Although versatile, HCA has limitations regarding the optimality of the solutions it finds.

The only case where HCA is guaranteed to find the optimal clustering solution is with single-linkage clustering, also known as the minimum spanning tree approach (MST). The MST approach is a method used in single-linkage HCA:

Consider the data points as nodes in a graph, with edges between them representing the distances (or similarities) between points. The MST is a subset of the edges of the graph that connects all the nodes without any cycles and with the minimum possible total edge weight. In the context of hierarchical clustering, the MST is used to iteratively merge the closest clusters. Starting with each datapoint as its own cluster, the two clusters that are connected by the shortest edge in the MST are merged first. This process continues until all points are merged into a single cluster.

For other linkage criteria (e.g. complete linkage, average linkage, Ward's method), hierarchical clustering cannot guarantee finding an optimal clustering solution because these methods do not explore all possible ways to form clusters.

The only way to ensure an optimal solution for these other linkage methods is through an exhaustive search of all possible clusterings, which is computationally infeasible for large datasets due to its exponential complexity -- $\mathcal{O}(2^n)$. 


## How Can I Apply It?

A divisive HCA strategy may be optimal for the intentions of this project.


## Key Steps

1. Measure the distance between each pair of data points.
2. Determine how the distance between clusters is computed based on distances between data points in each cluster.
3. Perform the clustering using the calculated distances and linkage criteria.
4. Visualize the clustering process and determine the optimal number of clusters.
5. Assign data points to clusters based on the dendrogram or a predefined number of clusters.

## Program Components

The components of an HCA program for comparative analysis of accretion discs should include:

1. Importing Libraries
    - Importing necessary libraries for handling images, performing calculations, and plotting results:
    - These may include `NumPy`, `SciPy`, `scikit-learn`, and `Matplotlib`.

2. Preprocessing Data:
    - Loading actual and simulated data of accretion discs.
    - Converting images to feature vectors (e.g. using pixel intensity, edge detection, and texture analysis).

3. Distance Matrix Calculation:
    - Selecting a distance metric (e.g. Euclidean, Manhattan, Cosine) to measure similarity between images.
    - Calculating the pairwise distance matrix for all images.

4. Linkage Method:
   - Choosing a linkage criterion (e.g. single linkage, complete linkage, average linkage, Ward's method) to determine the distance between clusters.
   - Using the selected linkage criterion to compute the linkage matrix, which defines the hierarchy of clusters.

5. Hierarchical Clustering Algorithm:
   - Apply the HCA using the distance matrix and linkage method to generate clusters.

6. Dendogram Plotting
    - Create a dendrogram to visualize the clustering process and determine the optimal number of clusters.

7. Cluster Assignment
    - Determine the number of clusters or cut the dendrogram at a specific height.
    - Assign each image to a cluster based on the dendrogram or predefined criteria.

8. Evaluation
    - Evaluate the quality of the clusters by using metrics such as silhouette score, Davies-Bouldin index, or visual inspection to validate the clustering results.

## Vocabulary

**Feature Vectors**
- A feature vector is a list of numerical values that represent an object's characteristics. In the context of machine learning and data analysis, a feature vector encapsulates the attributes of a data point in a structured format that can be used for training models or performing analysis.
- Examples:
    - In image processing, a feature vector might contain pixel intensity values, color histograms, or edge detection results.
    - In Natural Language Processing (NLP), a feature vector might represent a text document through term frequency-inverse document frequency (TF-IDF) values, word embeddings, or other textual features.
    - For sensor data, a feature vector might include readings from different sensors at a given time point.
      
**Distance Metrics**
- Distance metrics are mathematical measures used to quantify the similarity or dissimilarity between two data points in a feature space. They are essential in clustering, classification, and other machine learning algorithms.
- Examples:
    - Euclidean Distance is the straight-line distance between two points in Euclidean space, useful for calculating the distances between two points in a 2D plane.
    - $$\sqrt{\Sigma_{i = 1} ^{n} (x_{i} - y_{i})^2}$$

    - Manhattan Distance is the sum of the absolute differences of their coordinates, useful in grid-based pathfinding algorithms like the A* algorithm.
    - $$\Sigma_{i = 1}^{n} |x_{i} - y_{i}|$$
    
    - Cosine Distance measures the cosine of the angle between two vectors, commonly used in text analysis to measure document similarity.
    - $$1 - \dfrac{\Sigma_{i = 1}^{n} x_{i}y_{i}}{\sqrt{\Sigma_{i = 1}^{n} x_{i}^{2} \sqrt{\Sigma_{i = 1}^{n} y_{i}^{2}}}}$$
 
    - Minkowski Distance is a generalized distance metric that includes both Euclidean and Manhattan distances as special cases.
    - $$(\Sigma_{i = 1}^{n}|x_{i} - y_{i}|^p)^{\dfrac{1}{p}}$$

**Linkage Methods**
- Linkage methods are criteria used in hierarchical clustering to determine the distance between sets of observations as clusters are formed.
- Examples:
    - Single Linkage, also known as 'nearest neighbor' clustering, is the minimum distance between elements of two clusters.
    - Complete Linkage, also known as 'farthest neighbor' clustering, is the maximum distance between elements of two clusters.
    - Average Linkage is the average distance between elements of two clusters.
    - Ward's Method minimizes the total within-cluster variance, and often produces more compact clusters.

**Silhouette Score**
- The silhouette score measures how similar an object is to its own cluster (cohesion) compared to other clusters (separation). It ranges from -1 to 1, where a high value indicates that the object is well matched to its own cluster and poorly matched to neighboring clusters.
- $$s(i) = \dfrac{b(i)-a(i)}{max(a(i),b(i))}$$
    - $a(i)$ is the average distance between the $i$-th point and all other points in the same cluster.
    - $b(i) is the average distance between the $i$-th point and all points in the nearest cluster.
    - A silhouette score close to 1 indicates that data points are well-clustered, while a score close to -1 indicates that data points might have been assigned to the wrong cluster. 

**Davies-Bouldin Index**
- The Davies-Bouldin Index (DBI) is an internal evaluation metric for clustering algorithms' quality. It is defined as the average similarity ratio of each cluster with its most similar cluster, where a lower value indicates better clustering.
- Lower DBI values indicate that clusters are well-separated and internally compact. It is often used to compare the performance of different clustering algorithms or the same algorithm with different parameters.
- $$DB = \dfrac{1}{k} \sum_{i = 1}^{k} max_{j \neq i} (\dfrac{s_i + s_j}{d_{ij}})$$
    - $s_i$ is the average distance between each point in cluster $i$ and the centroid of cluster $i$.
    - $d_{ij}$ is the distance between the centroids of clusters $i$ and $j$.
    - $k$ is the number of clusters.
