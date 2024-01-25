if (!requireNamespace("testthat", quietly = TRUE)) {
  install.packages("testthat")
}


library(testthat)
library(readr)

file_path <- "output/data/Cleaned_Simulated_Marrige_Licence_Statistics.csv"
cleaned_simulated_marriage_data <- read_csv(file_path)
test_that("Data Validity Test", {
  date_columns <- c("date_column1", "date_column2", "date_column3")  
  valid_year <- 2021
  expect_true(all(year(cleaned_simulated_marriage_data[, date_columns]) == valid_year),
              "All date columns should be from the year 2021.")
  
  civic_centre_columns <- c("civic_centre_column1", "civic_centre_column2") 
  valid_civic_centres <- c("ET", "NY", "TO", "SC")
  expect_true(all(cleaned_simulated_marriage_data[, civic_centre_columns] %in% valid_civic_centres),
              "Civic_centre columns should only include values in c('ET', 'NY', 'TO', 'SC').")
})
cat("All tests passed successfully!\n")
