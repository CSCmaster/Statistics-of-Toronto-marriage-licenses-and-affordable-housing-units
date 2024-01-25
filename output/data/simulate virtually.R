
#install.packages("tidyverse")
#install.packages("knitr")
library(dplyr)
library(tidyr)
library(knitr)

set.seed(123)

quarters <- rep(c("Q1", "Q2", "Q3", "Q4"), each = 100)
subsidized_units <- rpois(400, lambda = 30) 
affordable_units <- rpois(400, lambda = 50)   
housing_data <- data.frame(Quarter = quarters, Subsidized_Units = subsidized_units, Affordable_Units = affordable_units)

knitr::kable(head(housing_data))
write.csv(housing_data, "housing_data.csv", row.names = FALSE)
