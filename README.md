Hello! See below on how to generate the final report and the organization and 
description of my project.

### Contents and Organization of the Repository

This project folder contains the following:

1) .gitignore
- ignores the contents of the output folder and the final report.html

2) `report.Rmd`
- Rmarkdown to make the report

3) README.md
- what you're reading!

4) Makefile
- `make` or `make report` makes report.html
- `make clean` cleans the output of the .rds and .png files, as well as the 
report.html

5) output folder
- should be empty in this repository, but after making the report, should 
contain `cleandata.rds`, `table.rds`, and `survival.png`

6) code folder
- contains the following:

`code/00_clean_data.R`
- imports the raw haberman.csv data
- adds column header names to the datafile
- outputs clean data as an rds file

`code/01_make_table.R`
- fits Kaplan-Meier curve on survival data
- creates and outputs Kaplan-Meier table

`code/02_make_figure.R`
- creates and outputs Kaplan-Meier figure

`code/03_render_report.R`
- renders `report.Rmd`

7) raw_data folder
- includes the raw haberman.csv data

### How to Generate the Final Report

In your terminal, type `make` or `make report.html` and `report.html` should be 
created in the main project folder!