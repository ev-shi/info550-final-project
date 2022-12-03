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

8) renv folder
- includes all the R package information

9) renv.lock
- records which R packages are used here, what version, etc

10) Dockerfile
- used to build the image

### Building the docker image

Building the docker image can be done by typing `make project_image` or 
`make pull_image` in your terminal. The former builds the image  
locally and takes longer whereas the latter pulls the image from 
Dockerhub (link [here](https://hub.docker.com/repository/docker/evshi/final_report)) 
and is faster. Feel free to do either!

### How to Generate the Final Report
The final report is then made by typing `make final_report` in your terminal. 
The resulting html file will be found in a folder called "final_report".