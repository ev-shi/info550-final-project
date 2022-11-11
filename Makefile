report.html: code/03_render_report.R report.Rmd \
  output/cleandata.rds output/table.rds output/survival.png
	Rscript code/03_render_report.R

output/cleandata.rds: code/00_clean_data.R raw_data/haberman.csv
	Rscript code/00_clean_data.R

output/table.rds: code/01_make_table.R output/cleandata.rds
	Rscript code/01_make_table.R

output/survival.png: code/02_make_figure.R output/cleandata.rds
	Rscript code/02_make_figure.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"