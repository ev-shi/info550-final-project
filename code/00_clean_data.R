here::i_am("code/00_clean_data.R")

# file path for the data
data_path <- here::here("raw_data/haberman.csv")

# import data
data <- read.csv(data_path, header = FALSE)

# name the variables
names(data) <- c("age", "op_year", "nodes", "surv_status")

saveRDS(
  data, 
  file = here::here("output/cleandata.rds")
)