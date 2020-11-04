### Read data and perform basic data cleaning


urlfile="https://raw.githubusercontent.com/juliasilge/supervised-ML-case-studies-course/master/data/voters.csv"
# urlfile="https://raw.githubusercontent.com/lrjoshi/webpage/master/public/post/c159s.csv"
voters <- read_csv(url(urlfile))



# Take a look at voters
glimpse(voters)

# turnout16_2016 is the response variable
# ... it's highly unbalanced
voters %>%
  count(turnout16_2016)

# How do the responses on the survey vary with voting behavior?
voters %>%
  group_by(turnout16_2016) %>%
  summarise(`Elections don't matter` = mean(RIGGED_SYSTEM_1_2016 <= 2),
            `Economy is getting better` = mean(econtrend_2016 == 1),
            `Crime is very important` = mean(imiss_a_2016 == 2))

# On this question about how the economy is doing, 
# an answer of 1 indicates “getting better”, 2 indicates “about the same”, 3 indicates “getting worse”, and 4 indicates “don’t know”.
voters %>% 
  mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
  ggplot(aes(x = econtrend_2016, y = after_stat(density), fill = turnout16_2016)) + 
  geom_histogram(alpha = 0.5, position = 'identity', binwidth = 1) + 
  labs(title = 'Overall, is the economy getting better or worse?')
