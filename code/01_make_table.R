here::i_am("code/01_make_table.R")

data <- readRDS(
  file = here::here("output/cleandata.rds")
)

# load in survival library, used for the Kaplan Meier function
library(survival)
# load in kableExtra for a pretty table
library(kableExtra)

# fitting Kaplan Meier Curve
surv <- survfit(Surv(age,surv_status) ~ 1, data = data, conf.type="log-log") 

# putting the desired information from the fit into a table
table_data <- data.frame(cbind(
  summary(surv)$time, 
  summary(surv)$n.risk,
  summary(surv)$n.event,
  summary(surv)$surv,
  summary(surv)$std.err,
  summary(surv)$lower,
  summary(surv)$upper
))
# round values
table_data <- round(table_data, digits = 2)

# label undefined sections of the Kaplan-Meier Function
table_data[,5] <- ifelse(is.na(table_data[,5]) , "0", table_data[,5])
table_data[,6] <- ifelse(is.na(table_data[,6]) , "0", table_data[,6])
table_data[,7] <- ifelse(is.na(table_data[,7]) , "0", table_data[,7])

# add column titles
names(table_data) <- c("Age", 
                       "Number of Patients at Risk", 
                       "Number of Patients Who Died Within 5 Years",
                       "Probability of Survival",
                       "Standard Error",
                       "Lower 95% CI",
                       "Upper 95% CI"
)
# make table 
table <- knitr::kable(table_data, align = "c") %>%
  kable_minimal("striped", "hover")

saveRDS(
  table,
  file = here::here("output/table.rds")
)