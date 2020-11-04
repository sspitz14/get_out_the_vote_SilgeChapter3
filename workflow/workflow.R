### workflow

vote_wf <- workflow() %>%
  add_recipe(vote_recipe) %>%
  add_model(rf_spec)

vote_wf