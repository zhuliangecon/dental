# setup.R

# setup.R

# Load required libraries
library(tidyverse)

# Clear workspace
rm(list = ls())

# Define global path settings
root_path <- "~/dental"
Data_path <- file.path(root_path, "Data")
Raw_path <- file.path(Data_path, "Raw")
Processed_path <- file.path(Data_path, "Processed")
# load package 
library(tidyverse)