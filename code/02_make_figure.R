here::i_am("code/02_make_figure.R")

data <- readRDS(
  file = here::here("output/cleandata.rds")
)

# load in survival library, used for the Kaplan Meier function
library(survival)

# fitting Kaplan Meier Curve
surv <- survfit(Surv(age,surv_status) ~ 1, data = data, conf.type="log-log") 

#saving the plot: opening the png
png("output/survival.png", width = 750, height = 500)

#creating the plot
plot(surv,xlab = "Age at Time of Operation", ylab = "Survival probability", 
     main = "Age and Survival Probability 5 Years After Breast Cancer Surgery",
)

#close the file
dev.off()