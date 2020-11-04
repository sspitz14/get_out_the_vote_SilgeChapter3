### EDA


libsneeded <- c("DataExplorer")
for(l in libsneeded) {
  if(!require(l, character.only = TRUE)) {
    install.packages(l)
    library(l, character.only = TRUE)
  }
}

glimpse(voters)

# remove non-modeling column
voters.eda <- voters %>% select(-case_identifier)

# extremely unbalanced DV
voters.eda %>% 
  count(turnout16_2016)



DataExplorer::introduce(voters.eda)

DataExplorer::plot_intro(voters.eda,
                         ggtheme = theme_minimal(),
                         title = "Automated EDA with Data Explorer")

DataExplorer::plot_missing(voters.eda)

DataExplorer::plot_histogram(voters.eda)

DataExplorer::plot_histogram(voters.eda)

DataExplorer::plot_correlation(voters.eda, cor_args = list( 'use' = 'complete.obs'))

# imiss_g_2016 looks interesting
# possibly imiss_o or imiss_i
# also: RIGGED_SYSTEM_3_2016, RIGGED_SYSTEM_4_2016, RIGGED_SYSTEM_5_2016
# in addition to econtrend_2016
plot_boxplot(voters.eda, by='turnout16_2016')
plot_boxplot(voters.eda, by='turnout16_2016', ggtheme = theme_minimal())


# On this question about how the economy is doing, 
# an answer of 1 indicates “getting better”, 2 indicates “about the same”, 3 indicates “getting worse”, and 4 indicates “don’t know”.
voters %>% 
  mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
  ggplot(aes(x = econtrend_2016, y = after_stat(density), fill = turnout16_2016)) + 
  geom_histogram(alpha = 0.5, position = 'identity', binwidth = 1) + 
  labs(title = 'Overall, is the economy getting better or worse?')