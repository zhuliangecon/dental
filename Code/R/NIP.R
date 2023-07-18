

source("~/dental/Code/R/setup.R")

# 导入data.table包
library(data.table)

# 使用fread()函数读取数据
NPI <- fread(file.path(Raw_path, "NPPES_Data_Dissemination_July_2023/npidata_pfile_20050523-20230709.csv"))

# 导入tidyverse包
library(tidyverse)

# 使用tidyverse函数处理数据
data <- NPI %>%
  select(NPI, 
         `Entity Type Code`, 
         `Provider Organization Name (Legal Business Name)`, 
         `Provider Last Name (Legal Name)`, 
         `Provider First Name`,
         `Provider Business Mailing Address City Name`,
         `Provider Business Mailing Address State Name`,
         `Provider Enumeration Date`,
         `Last Update Date`,
         `Provider Gender Code`,
         `Healthcare Provider Taxonomy Code_1`,
         `Healthcare Provider Taxonomy Code_2`,
         `Healthcare Provider Taxonomy Code_3`,
         `Healthcare Provider Taxonomy Code_4`,
         `Healthcare Provider Taxonomy Code_5`,
         `Healthcare Provider Taxonomy Code_6`,
         `Healthcare Provider Taxonomy Code_7`,
         `Healthcare Provider Taxonomy Code_8`,
         `Healthcare Provider Taxonomy Code_9`,
         `Healthcare Provider Taxonomy Code_10`,
         `Healthcare Provider Taxonomy Group_1`,
         `Is Sole Proprietor`,
         `Parent Organization LBN`,
         `Parent Organization TIN`,
         `Is Organization Subpart`,
         `Certification Date`
         )

taxonomy_codes <- c("122300000X", "1223G0001X", "1223D0001X", "1223D0004X","1223E0200X",
                    "1223P0106X", "1223X0008X", "1223S0112X", "1223X0400X",
                    "1223P0221X", "1223P0300X", "1223P0700X")

# 创建一个逻辑矩阵，检查每个分类代码是否在我们定义的分类代码中
taxonomy_matrix <- df %>%
  select(starts_with("Healthcare Provider Taxonomy Code_")) %>%
  map(~ .x %in% taxonomy_codes)

# 对数据进行过滤
df_filtered <- df %>%
  filter(rowSums(taxonomy_matrix) > 0)
  
