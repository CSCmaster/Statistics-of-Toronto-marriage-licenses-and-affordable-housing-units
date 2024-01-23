#### Preamble ####
# Purpose: Get data on 2011-2023 Toronto marriage license and make table
# Author: Jingyi Shen
# Email: jingyi.shen@mail.utoronto.ca
# Date: 22 January 2024
# Prerequisites: -
#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)
marriage_packages <- search_packages("Marriage Licence")
marriage_resources <- marriage_packages |>
  list_package_resources()

Toronto_marriage<-
  # "https://open.toronto.ca/dataset/marriage-licence-statistics/"
  list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb") |>
  filter(name == "Marriage Licence Statistics Data.csv") |>
  get_resource()

write_csv(
  x = Toronto_marriage_licence,
  file = "Marriage Licence Statistics.csv"
)

head(Toronto_marriage)

