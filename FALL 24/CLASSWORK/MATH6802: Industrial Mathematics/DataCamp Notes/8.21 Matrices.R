# Matrices in R

# Matrices in R are collections of elements of the same data type.
  # Fixed number of rows and columns. 
  # We use the matrix() function to construct matrices.

# In the matrix() function:
  # The first argument is the collection of elements that will be arranged into the rows and columns of the matrix.
  # The argument `byrow` indicates that the matrix is filled by the rows; if we want the matrix to be filled by the columns, we place byrow = FALSE.
  # The third argument `nrow` indicates the number of rows our matrix should have.
  # The fourth argument `ncol` indicates the number of columns. We don't need both `nrow` and `ncol`.
  # `dimnames` enables us to define the dimensions of the matrix.

# All together, this looks like:
# matrix(data = "data", nrow = "no. of rows", ncol = "no. of cols", byrow = "LOGICAL", dimnames = "DIMENSION NAMES")

# Constructing a matrix with 3 rows that contain the numbers 1 through 2:
matrix(1:9, byrow = TRUE, nrow = 3)
  # The elements 1 through 9 are stored in this matrix sequentially.
  # Our elements are sequences as rows (*by* rows) and not columns.
  # Our matrix has 3 rows; this defaults to 3 columns as it distributes the sequence evenly across rows.

# R actually formats matrices nicely for us (unlike Mathematica...):
  # [,1] [,2] [,3]
  # [1,]    1    4    7
  # [2,]    2    5    8
  # [3,]    3    6    9

# We can use vectors alongside matrices!

#============== SAMPLE PROBLEM ==============
# Each vector below represents the box office numbers for three movies.
  # The first element indicates the US box office revenue.
  # The second element indicates the Non-US box office revenue.

new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Combining all three vectors into one vector, we can use the concatenation function:
box_office <- c(new_hope, empire_strikes, return_jedi)

# Constructing a matrix with three rows, where each row represents a movie's data:
star_wars_matrix <- matrix(box_office,nrow = 3, byrow = TRUE)
star_wars_matrix # This yields:
  # [,1]  [,2]
  # [1,] 460.998 314.4
  # [2,] 290.475 247.9
  # [3,] 309.306 165.8

# To help remember what these values mean, we can attribute names to the rows and columns of our matrix:

region <- c("US", "non-US") # Attributing the two regions of our data to a `region` vector
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi") # Attributing the movie titles featured in our data to a `titles` vector

rownames(star_wars_matrix) <- titles
  # rownames(matrix_name) <- row_name_vector
colnames(star_wars_matrix) <- region
  # colnames(matrix_name) <- col_name_vector

# Now, `star_wars_matrix` will yield:
  #                         US       non-US
  # A New Hope              460.998  314.4
  # The Empire Strikes Back 290.475  247.9
  # Return of the Jedi      309.306  165.8

# What if we want to calculate the total box office revenue for the three movies worldwide?
  # rowSums() calculates the total for each row of a matrix.

worldwide_vector <- rowSums(star_wars_matrix) # Worldwide box office totals = sums of each row of the star wars matrix.
# This yields:
  # A New Hope The Empire Strikes Back      Return of the Jedi 
  # 775.398                 538.375                 475.106 

# Now that we've calculated this additional information (worldwide box office totals for each movie), we want to add this to our matrix.
  # cbind() is a function that merges matrices and vectors together by column.
  # the arguments of cbind() are the matrices and vectors you wish to merge, e.g. cbind(matrix1, matrix2, vector1, vector2).

all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector) # Attributes combination of s_w_m and w_v to the variable a_w_m
# This yields:
  #                           US     non-US     worldwide_vector
  # A New Hope              460.998  314.4          775.398
  # The Empire Strikes Back 290.475  247.9          538.375
  # Return of the Jedi      309.306  165.8          475.106

# We can also add more rows using rbind().

# Defining a new matrix to demonstrate this...

phantom_menace <- c(474.5, 552.5)
attack_clones <- c(310.7, 338.7)
revenge_sith <- c(380.3, 468.5)
prequel_box_office <- c(phantom_menace, attack_clones, revenge_sith)
prequel_titles <- c("The Phantom Menace", "Attack of the Clones", "Revenge of the Sith")
star_wars_matrix2 <- matrix(prequel_box_office, nrow = 3, byrow = TRUE)
rownames(star_wars_matrix2) <- prequel_titles
colnames(star_wars_matrix2) <- region
# This matrix yields:
  #                       US   non-US
  # The Phantom Menace   474.5  552.5
  # Attack of the Clones 310.7  338.7
  # Revenge of the Sith  380.3  468.5

all_wars_matrix2 <- rbind(star_wars_matrix, star_wars_matrix2)
# This matrix yields:
  #                           US     non-US
  # A New Hope              460.998  314.4
  # The Empire Strikes Back 290.475  247.9
  # Return of the Jedi      309.306  165.8
  # The Phantom Menace      474.500  552.5
  # Attack of the Clones    310.700  338.7
  # Revenge of the Sith     380.300  468.5

# We can also compute column sums:
total_revenue_vector <- colSums(all_wars_matrix2) # This yields:
  # US       non-US 
  # 2226.279 2087.800 

# We can use [square brackets] to select matrix elements the same way we select vector elements.

  # Because matrices have two dimensions, we should distinguish the rows we want to select vs. the columns we want to select using commas:
    # my_matrix[1, 2] selects the elements at the FIRST row and SECOND column.

  # If we want to select all elements of a row or column, no number is needed before or after the comma:
    # my_matrix[, 1] selects all elements of the first column
    # my_matrix[1, ] selects all elements of the first row.

# To select the non-US revenue for all movies--so, the second column of our matrix:
non_us_all <- all_wars_matrix2[,2] # Selects the entire 2nd column of a_w_m2

# To average this value:
mean(non_us_all)

# To select the non-US revenue for the first two movies, we want to select only 2 rows worth of data from the second column:
non_us_some <- all_wars_matrix[1:2, 2] # Rows 1 through 2, Column 2
# This yields:
  # A New Hope The Empire Strikes Back 
  # 314.4                   247.9 

# We can also do some arithmetic with matrices: the standard operators (+ - / *) work in an element-wise way on matrices in R!

# We want to determine how many visitors went to each movie for each geographical area. We already have total revenue figures in `all_wars_matrix2`. If we take the price of a ticket to be $5, let's compute the number of visitors:

visitors <- all_wars_matrix2 / 5 # This yields:
  #                         US       non-US
  # A New Hope              92.1996  62.88
  # The Empire Strikes Back 58.0950  49.58
  # Return of the Jedi      61.8612  33.16
  # The Phantom Menace      94.9000 110.50
  # Attack of the Clones    62.1400  67.74
  # Revenge of the Sith     76.0600  93.70

# Even further, we can perform matrix-matrix operations:
  # This applies to all basic operators (+ - / *)
  # `matrix1 * matrix2` creates a matrix where each element is a product of the corresponding elements.
  # THIS IS NOT STANDARD MATRIX MULTIPLICATION! 
    # For that, we would compute `matrix1 %*% matrix2`


