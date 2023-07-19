

source("~/dental/Code/R/setup.R")

library(data.table)

# Define the file path
file_path <- file.path(Raw_path, "NPPES_Data_Dissemination_July_2023/npidata_pfile_20050523-20230709.csv")

# Define the columns to select
selected_columns <- c("NPI", 
                      "Entity Type Code", 
                      "Provider Organization Name (Legal Business Name)", 
                      "Provider Last Name (Legal Name)", 
                      "Provider First Name",
                      "Provider First Line Business Mailing Address",
                      "Provider Business Mailing Address City Name",
                      "Provider Business Mailing Address State Name",
                      "Provider Enumeration Date",
                      "Last Update Date",
                      "Provider Gender Code",
                      "Healthcare Provider Taxonomy Code_1",
                      "Healthcare Provider Taxonomy Code_2",
                      "Healthcare Provider Taxonomy Code_3",
                      "Healthcare Provider Taxonomy Code_4",
                      "Healthcare Provider Taxonomy Code_5",
                      "Healthcare Provider Taxonomy Code_6",
                      "Healthcare Provider Taxonomy Code_7",
                      "Healthcare Provider Taxonomy Code_8",
                      "Healthcare Provider Taxonomy Code_9",
                      "Healthcare Provider Taxonomy Code_10",
                      "Healthcare Provider Taxonomy Group_1",
                      "Is Sole Proprietor")

# Fast read in the data by data.table
npidata <- fread(file_path, select = selected_columns)


library(tidyverse)


taxonomy_codes <- c("122300000X", "1223G0001X", "1223D0001X", "1223D0004X","1223E0200X",
                    "1223P0106X", "1223X0008X", "1223S0112X", "1223X0400X",
                    "1223P0221X", "1223P0300X", "1223P0700X")

npidata_filtered <- npidata %>%
  filter(`Provider Business Mailing Address State Name` == "NH") %>%
  filter(
    `Healthcare Provider Taxonomy Code_1` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_2` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_3` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_4` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_5` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_6` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_7` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_8` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_9` %in% taxonomy_codes |
      `Healthcare Provider Taxonomy Code_10` %in% taxonomy_codes
  ) %>%
  select(-starts_with("Healthcare Provider Taxonomy Code")) %>%
  rename(
    NPI = NPI,
    entity_type = `Entity Type Code`,
    org_name = `Provider Organization Name (Legal Business Name)`,
    last_name = `Provider Last Name (Legal Name)`,
    first_name = `Provider First Name`,
    address_first_line = `Provider First Line Business Mailing Address`,
    city = `Provider Business Mailing Address City Name`,
    state = `Provider Business Mailing Address State Name`,
    enum_date = `Provider Enumeration Date`,
    update_date = `Last Update Date`,
    gender = `Provider Gender Code`,
    taxonomy_group = `Healthcare Provider Taxonomy Group_1`,
    is_sole_proprietor = `Is Sole Proprietor`,
  )

write_csv(npidata_filtered, file.path(Processed_path, "NPI.csv"))


# endpoint <- read_csv((file.path(Raw_path, "NPPES_Data_Dissemination_July_2023/endpoint_pfile_20050523-20230709.csv"))) %>%
#   select(NPI, Affiliation, 
#          `Affiliation Legal Business Name`,
#          `Affiliation Address State`) %>%
#   filter(`Affiliation Address State` == "NH")

