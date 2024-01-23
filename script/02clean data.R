marriage_packages <- search_packages("Marriage Licence Statistics")
marriage_packages

Toronto_marriage_license <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
Toronto_marriage_license
# "https://open.toronto.ca/dataset/marriage-licence-statistics/"
list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb") |>
  filter(name == "Marriage Licence Statistics Data.csv") |>
  get_resource()

write_csv(
  x = Toronto_marriage_licence,
  file = "Marriage Licence Statistics.csv"
)

head(Toronto_marriage_license)

#### Simulate ####
set.seed(100666)

simulated_data <- tibble(
  date = rep(x = seq(as.Date("2021-01-01"), by = "days", length.out = 365), times = 3),
  id = rep(1:3, each = 365),
  civic_centre = rep(c("ET", "NY", "SC"), each = 365),
  marriages_licenses = rpois(n = 365 * 3, lambda = 30),
  time_period = case_when(
    month(date) %in% 1:3 ~ "Q1",
    month(date) %in% 4:6 ~ "Q2",
    month(date) %in% 7:9 ~ "Q3",
    month(date) %in% 10:12 ~ "Q4"
  )
)

head(simulated_data)
write_csv(
  x = simulated_data,
  path = "Simulated_Marriage_Licence_Statistics.csv"
)
}
library(dplyr)
library(janitor)
simulated_data <- read_csv("Simulated_Marriage_Licence_Statistics.csv")
simulated_data <- simulated_data %>%
  distinct()
sum(is.na(simulated_data))
simulated_data <- simulated_data %>%
  filter(marriages_licenses > 0)
write_csv(
  x = simulated_data,
  path = "Cleaned_Simulated_Marriage_Licence_Statistics.csv"
)

head(simulated_data)