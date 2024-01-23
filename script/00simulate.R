library(tibble)
library(dplyr)
library(readr)

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

library(ggplot2)
ggplot(cleaned_simulated_data, aes(x = time_period, y = marriages_licenses, fill = civic_centre)) +
  geom_histogram(stat = "identity", position = "dodge", binwidth = 5, alpha = 0.7) +
  labs(title = "Histogram of Marriages Licenses by Time Period",
       x = "Time Period",
       y = "Marriages Licenses")

library(ggplot2)
cleaned_simulated_data <- read_csv("Cleaned_Simulated_Marriage_Licence_Statistics.csv")
ggplot(cleaned_simulated_data, aes(x = civic_centre, y = marriages_licenses, fill = civic_centre)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(title = "Barplot of Marriages Licenses by Civic Centre",
       x = "Civic Centre",
       y = "Total Marriages Licenses")



