#### Preamble ####
# Purpose: Get data on 2020-2023 Toronto afforable housing and make table
# Author: Jingyi Shen
# Email: jingyi.shen@mail.utoronto.ca
# Date: 22 January 2024
# Prerequisites: -


relevant_packages <- search_packages("Active Affordable and Social Housing Units") 
print(relevant_packages)
Affordable_Housing <-
  list_package_resources("active-affordable-and-social-housing-units") |>
  filter(name == "Social and Affordable Housing.csv") |>
  get_resource()
write_csv(
  x = Affordable_Housing,
  file = "Affordable Housing.csv"
)
head(Affordable_Housing)

set.seed(123)

simulated_housing_data <- tibble(
  quarter = rep(c("Q1", "Q2", "Q3", "Q4"), times = 3),
  subsidized_housing_units = rpois(n = 4 * 3, lambda = 20),
  affordable_housing_units = rpois(n = 4 * 3, lambda = 30)
)

write_csv(
  x = simulated_housing_data,
  path = "Simulated_Affordable_Social_Housing_Units.csv"
)
simulated_housing_data <- read_csv("Simulated_Affordable_Social_Housing_Units.csv")
head(simulated_housing_data) 
   

