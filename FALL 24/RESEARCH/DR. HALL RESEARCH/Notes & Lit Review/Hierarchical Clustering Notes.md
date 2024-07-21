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

Feature Vectors

Distance Metrics
  - *different kinds of distance metrics*

Linkage Method
  - *different linkage criterion*

Silhouette Score

Davies-Bouldin Intex
