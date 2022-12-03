# Rule to make the final report
report.html: code/03_render_report.R report.Rmd \
  output/cleandata.rds output/table.rds output/survival.png
	Rscript code/03_render_report.R

# The following rules are for generating outputs
output/cleandata.rds: code/00_clean_data.R raw_data/haberman.csv
	Rscript code/00_clean_data.R

output/table.rds: code/01_make_table.R output/cleandata.rds
	Rscript code/01_make_table.R

output/survival.png: code/02_make_figure.R output/cleandata.rds
	Rscript code/02_make_figure.R

# Cleaning up the project -- removing output and final report
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html

# For synchronizing the project packages
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# Building the project image
project_image:
	docker build -t evshi/final_report .

# Pulling the project image from Dockerhub (faster)
pull_image:
	docker pull evshi/final_report

# Building the report automatically in our container
.PHONY: final_report
final_report:
	docker run -v "/$$(pwd)/final_report":/project/final_report evshi/final_report
