## LOAD PACKAGES ####
library(dplyr)

## READ IN DATA ####
data = read.table("data/rcourse_lesson3_data.txt", header =T, sep = "\t")

# Read in play (Buster Posey) specific data
data_posey <- read.table("data/rcourse_lesson3_data_posey.txt", header = T, sep = "\t")

## CLEAN DATA ####
# add colums to full season data to make sata set specific to the Giants 

data_clean <- data %>%
    mutate(home_visitor = ifelse(home_team == "SFN", "home", "visitor"))

# now add information as to whether or not the games were before or after the All-Star game
# The All-Star game occured on July 13, 2010 = 20100713

data_clean <- data %>%
    mutate(home_visitor = ifelse(home_team == "SFN", "home", "visitor")) %>%
    mutate(allstarbreak = ifelse(date < 20100713, "before", "after"))

# Now we need a column for wins and losses.  We'll do this with the following logic:
# 1.  We'll add a column called 'win' and
# 2.  If SFN is the home team and the home team scored more runs than the visitor then "1"
# 3.  If SFN is the visiting team and the home team scored fewer runs than "1", else
# 4.  "0" (meaning a loss)

data_clean <- data_clean %>%
    mutate(win = ifelse(home_team == "SFN" & home_score > visitor_score, 1, 
                ifelse(visitor_team == "SFN" & home_score < visitor_score, 1, 0)))

# Combine full season data with a specific player (Buster Posey) specific data and clean

data_posey_clean <- data_posey %>%
    inner_join(data_clean)

data_posey_clean <- data_posey_clean %>%
    mutate(walked = ifelse(walks >0, "yes", "no"))



