#Load in packages
library(dplyr)
library(tidyverse)

#Read in data
covidData <- read.csv("us-counties.csv")

#Filter pa data
pa <- filter(covidData, state == "Pennsylvania")

# Calculate changes in cases and deaths
pa <- pa %>%
  mutate(incr_cases = c(NA, diff(cases)), 
         incr_deaths = c(NA, diff(deaths)))

# Calculate the standard deviation of incr_cases in PA
sd_incr_cases <- sd(pa$incr_cases, na.rm = TRUE)
cat("The standard deviation of incr_cases in PA is", sd_incr_cases, "\n")

