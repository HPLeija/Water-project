# Load required libraries 
libraries <- c("tidyverse", "dplyr", "readxl", "ggplot2", "caret", "rvest", "corrplot", "graphics", "gridExtra", "randomForest", "kernlab", "glmnet")

# Install and load libraries if not already installed
for (library in libraries) {
  if (!require(library, character.only = TRUE)) {
    install.packages(library)
    library(library)
  }
}

## I imported the dataset to this project.


# Read the entire data
#data <- read.csv("/cloud/project/JMP-WASH-in-health-care-facilities-2022-data-by-country(1).csv", stringsAsFactors = FALSE)
data <- read.csv("C:/Users/meatb/Downloads/JMP-WASH-in-health-care-facilities-2022-data-by-country.csv", header = TRUE, skip = 1, na.strings = ".")
# Read the data

#data <- read.csv("/cloud/project/JMP-WASH-in-health-care-facilities-2022-data-by-country(1).csv", header = TRUE, skip = 1, na.strings = ".")

glimpse(data)
head(data)
str(head)
str(data)

summary(data)


# Clear the data snippet
cleaned_data <- gsub("[>,]", "", data)  # Remove '>' and ',' characters
cleaned_data <- gsub("\\s+", ",", data)  # Replace consecutive spaces with a comma

# Split the data into individual rows
data_rows <- strsplit(cleaned_data, "\n")[[1]]

# Convert to a data frame
data_df <- as.data.frame(do.call(rbind, strsplit(data_rows, ",")))

# Set column names
colnames(data_df) <- c("Country", "Year", "Population", "Urban_Percentage", "Basic_Water_Services", 
                       "Limited_Water_Services", "No_Water_Service", "Improved_Water_Source", "Improved_Water_On_Premises",
                       "Region1", "Region2", "Region3", "Region4", "Code")

# Print the resulting data frame
print(data_df)

df %>% as_tibble() %>% print(n=134)

# Convert character vector to numeric vector
numbers <- as.numeric(chars)

# View numeric vector
numbers

# Display the structure of the data

str(data)

glimpse(data)

colnames(data)

# Replace "-" with NA
data[data == "-"] <- NA

# Convert all columns to numeric where applicable
data <- as.data.frame(sapply(data, function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)


# Handle special characters or missing values
data <- na_if(data, "<1")  # Replace "<1" with NA
data <- na_if(data, ">99") # Replace ">99" with NA
data[is.na(data)] <- 0     # Replace NA with 0 for numeric columns

# View the structure of the dataset
str(data)
head(data)
tail(data)
summary(data)
