# Factors in R

# Factors refer to a statistical data type used to store categorical variables.
  # The difference between a categorical variable and a continuous variable is that a categorical variable can belong to a limited number of categories.
  # Continuous variables can correspond to an infinite number of values.

# It is important that R knows whether it is dealing with a continuous or categorical variable, as statistical models in R treat both types differently. 

# To create factors in R, you can make use of the function factor().
  # The first thing we must do is create a vector that contains all of the observations that belong to a limited number of categories. 
  # For example:

sex_vector<-c("Male","Female","Female","Male","Male")
  # Concatenates elements into vector.
factor_sex_vector<-factor(sex_vector)
  # Signifies this as a factor.
factor_sex_vector
  # This yields:
  # [1] Male   Female Female Male   Male  
  # Levels: Female Male

# There are two types of categorical variables: Nominal Categorical Variables & Ordinal Categorical Variables.
  # Nominal Variables are categorical variables without an implied order, i.e. it's impossible to say one is worth more than the other.
  # e.g:
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector
  # This yields:
  # [1] Elephant Giraffe  Donkey   Horse   
  # Levels: Donkey Elephant Giraffe Horse
  
  # Ordinal Variables are categorical variables with an implied natural ordering.
  # e.g:
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector
  # This yields:
  # [1] High   Low    High   Low    Medium
  # Levels: Low < Medium < High

# Working with Factor Levels
# When we are given a dataset, it may have factors with specific factor levels. Sometimes, we may want to change the names of these levels for clarity (or other reasons).
  # We can do this with the function levels():

  # levels(factor_vector) <- c("name1", "name2", ...)

# Let's try an example: let's say we have survey data in which each applicant specified their gender (M or F). 
# Recording gender with abbreviations is convenient if collecting data with pen and paper, but when analyzing it, it may be confusing and we might want to change the factor levels to "Male" and "Female" instead of "M" and "F". 
  # We can use levels() for this!
  # It is important to note that the order with which we assign levels is important.
  # If we don't specify the levels of the factor when creating the vector, R will automatically assign them alphabetically. 

survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
  # This yields:
  # [1] M F F M M
  # Levels: F M 
    # Notice that the levels shown (F and M) are listed in that specific order. 
    # Therefore when assigning levels when re-naming them, they must be in this order (Female, Male) in order to correctly match the elements of factor_survey_vector with their new names. 

levels(factor_survey_vector) <- c("Female", "Male")
  # This yields:
  # [1] Male   Female Female Male   Male  
  # Levels: Female Male

# Summarizing a Factor
  # The function `summary()` will give a quick overview of the contents of a variable.
  # Let's say we wanted to identify the amount of male responses and the amount of female responses in our survey vector:

summary(survey_vector)
  # This yields:
  #    Length     Class      Mode 
  #      5      character character 

summary(factor_survey_vector)
  # Female   Male 
  #   2      3 

# What happens when we try to compare elements of a factor?
  # In factor_survey_vector, we have a factor with two levels ("Male" and "Female"). How does R value these relative to each-other?

  # Defines `male` as 1st element in factor_survey_vector ("Male")
  male <- factor_survey_vector[1]

  # Defines `female` as 2nd element in f_s_v ("Female")
  female <- factor_survey_vector[2]

  # Compares both & prints output as logical.
  male > female
    # This yields:
    # Warning message: ‘>’ not meaningful for factors
    # [1] NA
  
# Since "Male" and "Female" are unordered (nominal) factor levels, R attaches an equal value to each level.
# When dealing with factors that have a natural ordering between categories, we have to ensure that we pass this information to R:
  
unordered_speed_vector <- c("m", "s", "s", "m", "f") # Defines speed vector with arguments of "m(edium)", "s(low)", and "f(ast)".
factored_unordered_speed_vector <- factor(unordered_speed_vector) # Returns elements alongside levels (Levels: f m s)
levels(factored_unordered_speed_vector) <- c("fast", "medium", "slow") # Assigns new names to levels; we ordered them in order levels were defined above.
  # factored_speed_vector will return:
  # [1] medium slow   slow   medium fast  
  # Levels: fast medium slow
    
# speed_vector is currently an unordered factor. To create an ordinal factor, we have to pass two additional arguments to factor():
  # ordered = TRUE (default is false if left empty)
  # levels = c("level1, "level2", "...) (indicates orders of levels)

speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factored_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast")) # Note the order for the levels here; in this case, it's in least to greatest order. Earlier, it was alphabetical.
  # This returns:
  # [1] medium slow   slow   medium fast  
  # Levels: slow < medium < fast

summary(factored_speed_vector)
  # This yields:
  #  fast medium   slow 
  #   1      2      2 
  
# Comparing Ordered Factors
  # How can we compare two elements in a factor?

da2 <- factored_speed_vector[2] # Assigns 2nd element of f_s_v to da2
da5 <- factored_speed_vector[5] # Assigns 5th element of f_s_v to da5
da2 > da5 # Outputs logical depending on validity of comparison.
  # This yields:
  # FALSE