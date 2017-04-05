# This is the script for doing statistical analysis

## READ IN DATA ####
source("scripts/rcourse_lesson3_cleaning.R")

## LOAD PACKAGES ####
# [none currently needed]

## ORGANIZE DATA ####
# Full season data
data_stats = data_clean

# Playser specific data
data_posey_stats = data_posey_clean

## BUILD MODEL -- FULL SEASON DATA ####

allstar.glm <- glm(data = data_stats, formula = win ~ allstar_break, family = "binomial")
allstar.glm_sum <-summary(allstar.glm)

## BUILD MODEL -- PLAYER SPECIFIC DATA ####
posey_walked.glm <- glm (data = data_posey_stats, formula = win ~ walked, family = "binomial")
