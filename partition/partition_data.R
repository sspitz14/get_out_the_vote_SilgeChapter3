### Partition data prior to modeling


# Split data into training and testing sets
set.seed(1234)
vote_split <- voters.eda %>%
  initial_split(p = 0.8,
                strata = turnout16_2016)
vote_train <- training(vote_split)
vote_test  <- testing(vote_split)

glimpse(vote_train)
glimpse(vote_test)