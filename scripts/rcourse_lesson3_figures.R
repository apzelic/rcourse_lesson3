## READ IN DATA ####
source("scripts/rcourse_lesson3_cleaning.R")

## LOAD PACKAGES (in this case for plotting) ####
library(ggplot2)

## ORGANIZE DATA ####

data_figs <- data_clean %>%
    mutate(allstar_break = factor(allstar_break, levels =c("before", "after")))

data_figs_sum <- data_figs %>%
    group_by(allstar_break) %>%
    summarize(wins_perc = mean(win)*100) %>%
    ungroup()

data_posey_figs <- data_posey_clean

data_posey_figs_sum <- data_posey_figs %>%
    group_by(walked) %>%
    summarize(wins_perc = mean(win)*100) %>%
    ungroup

## MAKE FIGURES ####
# All-star break

allstar.plot <- ggplot(data_figs_sum, aes(x = allstar_break, y = wins_perc)) +
    geom_bar(stat = "identity") +
    ggtitle("Win percentage before and after the World Series break") + 
    ylim (0,100)

pdf("figures/allstar.pdf")
allstar.plot
dev.off()

posey_walked.plot <- ggplot(data_posey_figs_sum, aes(x=walked, y=wins_perc)) +
    geom_bar(stat="identity") +
    ggtitle("When Posey walks do the Giants win?") + 
    ylab("Winning percentage") +
    ylim(0,100)

pdf("figures/posey_walked.pdf")
posey_walked.plot
dev.off()





