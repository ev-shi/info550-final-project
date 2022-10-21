here::i_am("code/03_render_report.R")

library(rmarkdown)
render(
  "report.Rmd",
  output_file = "report.html"
)