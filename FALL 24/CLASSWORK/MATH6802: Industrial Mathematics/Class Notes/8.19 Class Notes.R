# Defining vectors in R:

# Vectors in R are lists of items that are the same type.
v_1 <- c(2, -1, 4, 5) # The c() function combines/concatenates object.
v_2 <- c(-3, 3, 7, 5)

# R works better with vector operations than with loops.
v_1 + v_2

# We can also have vectors of strings ("characters"):
v_fruits <- c("apples", "bananas", "oranges")
v_fruits

# To create vectors with numerical values in a sequence, we use colons:
v_numbers <- 1:10
v_numbers # This will print "1, 2, 3, ..., 10"

#======================
# Working with Data:

# Before each session in R, we want to execute the following.
# This prevents having to deal with variables from previous files stored.
rm(list = ls()) # Removes objects in workspace.
dev.off() #Closes old plots.

# Next, we must set our working directory.
# This tells R where the files we want to read are:
setwd("~Users/anniem/Desktop/Classwork-and-Notes/FALL 24/CLASSWORK/MATH6802: Industrial Mathematics/Class Notes")
getwd() # Equivalent to pwd

# Installing relevant packages:
#install.packages("readxl") This only needs to be done once.
install.packages ("ggplot2")
#library(readxl) This enables us to use this library.
library(ggplot2)

# VERY HELPFUL GGPLOT CHEAT SHEET:
# https://docs.google.com/viewerng/viewer?url=https://rstudio.github.io/cheatsheets/data-visualization.pdf

# Naming AND reading in our dataset allows us to manipulate it:
transdata <- read_excel("8.19 Class Data.xlsx")

# Gives us the first 6 rows and column headers.
head(transdata)
dim(transdata) # We should have 159 rows of data, but that might not be the case since there are a few empty rows.

# Allows you to read column names.
colnames(transdata)

# Reads off the entries in the column named "County"
transdata$County
  # Note that the $ operator selects elements of a list.

# Notice that our dataset includes one additional row that isn't a county: "Georgia."
# To manage this, we're re-assigning only rows 1 through 159 to the variable name 'transdata'.
transdata<-[1:159,] # This is giving us an error because we have an empty row...

colnames(transdata) <- c("cty", "dvt_r") # Names columns in graph. 
  # cty = county
  # dvt_r = daily vehicles travelled on miles per road

# Here, we're plotting a histogram using ggplot.
ggplot(transdata, aes(dvt_r))+geom_histogram() 

# aes() describes how variables are mapped to visual properties in graphs (e.g. x and y variables)
  # Here, we've set transdata as the x-axis and dvt_r as our y-axis for a geometric histogram. 

# More detailed histogram:
ggplot(transdata, aes(dvt_r))+geom_histogram()+geom_histogram(color="black",fill="blue")+
  ggtitle("Daily Vehicle Miles Traveled, Rural")+
  xlab("Daily Miles Traveled")+ylab("Number of Counties")

# Producing a 5-number summary:
summary(transdata$dvt_r)
