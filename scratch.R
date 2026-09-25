library(dplyr)

set.seed(42)

my_data <- tibble(
  # 1. Create a column assigning 100 rows evenly into two groups
  Sex = sample(c("Male","Female"), 200, replace = TRUE),
) %>% 
  # 2. Assign values based on which group the row belongs to
  mutate(Value = ifelse(Sex == "Male", 
                        rnorm(n(), mean = 25, sd = 2.9), 
                        rnorm(n(), mean = 15, sd = 2.9)))

# Check the results
print(my_data)

# Set the number of data points you want to generate
n <- 1000  

# In a normal distribution, 95% of the data lies within roughly 1.96 
# standard deviations on either side of the mean
# Mean (μ): The midpoint of your range (18.5 + 30)/2
# Standard Deviation (σ): Half of the range width divided by 1.96 (30-18.5)/(2*1.96)

#mean <- (18.5 + 30)/2
mean <- 25
sd <- (30-18.5)/(2*1.96)

# Generate the data using calculated mean and sd
my_data <- rnorm(n, mean = mean, sd = sd)

# Verify the empirical 95% range of your generated data
quantile(my_data, probs = c(0.025, 0.975))

hist(my_data)
