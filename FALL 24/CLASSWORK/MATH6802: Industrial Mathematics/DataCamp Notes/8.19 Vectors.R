# Vectors in R

# Creating Vectors:
# Vectors can be assigned different object types.
integer_vector <- c(1, 10, 49) # We can have a numeric integer vector...
numeric_vector <- c(1.5, 10.5, 49.5) # Or a numeric decimal/float vector...
character_vector <- c("a", "b", "c") # Or a character vector...
boolean_vector <- c(TRUE, FALSE) # Or a boolean vector...
mixed_vector <- c("a", TRUE, 1, 1.5) # Or a mixed vector!

# When notating vectors, we use the c() function, which concatenates objects into a list.

#============== SAMPLE PROBLEM ==============
# After one week in Las Vegas and still zero Ferarris in your garage, you decide that it
# is time to start using your data analytical superpowers.

# Before doing a first analysis, you decide to first collect all the winnings and losses
# for the past week.

# In poker, you:
# Won $140 on Monday
# Lost $50 on Tuesday
# Won $20 on Wednesday
# Lost $120 on Thursday
# Won $240 on Friday
poker_vector <- c(140, -50, 20, -120, 240)

# In roulette, you:
# Lost $24 on Monday
# Lost $50 on Tuesday
# Won $100 on Wednesday
# Lost $350 on Thursday
# Won $10 on Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# Naming a Vector:
# Each element in a vector might refer to a specific quantity of category, but it may be 
# difficult to identify what belongs to what from the get-go. 

# We can give a name to the elements of a vector with the names() function.
# Here, we're assigning days to the winnings (and losses) made each day in Vegas:

names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# This is a redundant and inefficient way of assigning these values as names to each vector.
# To optimize this, we can assign the days-of-the-week vector to a variable:

days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Then, we can repeat the same process as above...
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Now that we have our winnings named as vectors, we can use them to find information:
  # How much has been our overall profit or loss per day of the week?
  # Have we lost money over the week in total?
  # Are we winning/losing money on poker or on roulette?

# To figure this out, we can do some basic vector arithmetic.

total_daily = poker_vector + roulette_vector # Sums poker_vector & roulette_vector
total_daily # Prints sum

# Because we've named our vectors, this ends up in a tabular format:
  # Monday   Tuesday Wednesday  Thursday    Friday 
  # 116      -100       120      -470       250 

# We can also calculate our total winnings in each game.
# To do this, we will make use of the sum() function.
  # sum() computes the sum of all elements in a vector.

# Computing our total winnings in poker:
total_poker <- sum(poker_vector) # Adds each day's gain/loss.
total_poker # Prints output: 230

# Computing our total winnings in roulette:
total_roulette <- sum(roulette_vector) # Adds each day's gain/loss
total_roulette # Prints output: -314

# Computing our total winnings overall:
total_week <- sum(total_poker, total_roulette) # Sums total gains/losses from each game.
total_week # Prints outpit: -84

# We can evaluate if one number is greater than another using a comparison:
total_poker > total_roulette # Compares the value for total_poker to total_roulette.
# If this is true, then we will produce the logical value TRUE.
# If this is false, then we will produce the logical value FALSE.
  # Because total_poker = 230 > -84 = total_roulette, this is TRUE!

total_poker < total_roulette # This produces FALSE, because -84 is not greater than 230.

# Maybe our performance was better on some days than others? 
# Let's take a look at the poker results from Wednesday--ONLY Wednesday:

# We can assign the 3rd element of the poker vector to the variable poker_wednesday:
poker_wednesday <- poker_vector[3] #[3] specifies the 3rd element.
poker_wednesday # Prints output

# This yields the 3rd entry, still in the same named/tabular format:
  # Wednesday 
  # 20

# How about our midweek results?
# To select multiple elements from a vector, we can add square brackets.
# We can indicate between the brackets what elements should be selected.

# Selecting the first and fifth day of the week...
days_1_and_5 <- poker_vector[c(1,5)] # Concatenates specification of 1st and 5th element.
days_1_and_5 # Prints output
# This yields:
  # Monday Friday 
  # 140    240 

# Selecting the full range of days one through five...
range_1_and_5 <- poker_vector[1:5] # start:end is equivalent to range[min, max] in Mathematica.
range_1_and_5 # Prints output
# This yields:
  # Monday   Tuesday Wednesday  Thursday    Friday 
  # 140       -50        20      -120       240 

# Selecting a few days in the middle...
poker_midweek <- poker_vector[2:4] # Picks inclusive range from 2nd to 4th element.
poker_midweek # Prints output
# This yields:
  # Tuesday Wednesday  Thursday 
  # -50        20      -120 

# We can also select elements in a vector by their assigned names:
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")] # Selects first 3 elements in concatenated list of Monday, Tuesday, Wednesday.
poker_start # Prints output.
# This yields:
  # Monday   Tuesday Wednesday 
  # 140       -50        20 

# We can also do basic operations with these selected values--
mean(poker_start)

# We can also subset vectors by comparison. To start, here are some operators:
1 < 2 # Less than
2 > 1 # Greater than
1 <= 2 # LEQ
2 >= 1 # GEQ
1 == 1 # Equal To
1 != 2 # NEQ

# Let's check which elements in our poker vector are positive:
selection_vector <- poker_vector > 0 # Assigns boolean values to each entry in poker_vector
selection_vector # Prints the result.
# This yields:
  # Monday   Tuesday Wednesday  Thursday    Friday 
  # TRUE     FALSE      TRUE     FALSE      TRUE 

# What if we want to not only find out the days we had a positive return, but the days on which we won?
# We can select desired elements using the same bracket notation as before.
  # This will pass a logical vector through square brackets yielding elements that correspond with TRUE.

selection_vector <- poker_vector > 0 # Assigns all positive values of p_v to s_v
poker_winning_days <- poker_vector[selection_vector] # Assigns all values of p_v that correlate with s_v to p_w_d
poker_winning_days # Prints output
# This yields:
  # Monday Wednesday    Friday 
  # 140        20       240  
