### prepare training data with recipes


if(!require('themis', character.only = TRUE)) {
  install.packages('themis')
  library(themis)
}

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
  step_upsample(turnout16_2016)