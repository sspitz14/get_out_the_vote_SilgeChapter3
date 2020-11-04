### model secifications

## Specify a ranger model
rf_spec <- rand_forest() %>%
  set_engine("ranger") %>%
  set_mode("classification")