# choosing r-ubuntu for development from the command line
FROM rocker/r-ubuntu

# Installing the necessary packages
RUN apt-get update && apt-get install -y pandoc libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev

# making a project directory in the image, and make it the working directory
RUN mkdir /project
WORKDIR /project

# making other directories
RUN mkdir code
RUN mkdir output
RUN mkdir raw_data

# copying files to the image
COPY Makefile .
COPY README.md .
COPY report.Rmd .

# copying renv-relevant files to the project image directory
COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/settings.dcf renv
COPY renv/activate.R renv

# Install package library at build time
RUN Rscript -e "renv::restore(prompt = FALSE)"

# Copy code and raw data to the image
COPY code/* code
COPY raw_data/* raw_data

# Make directory for final report
RUN mkdir final_report

# Create report and copy it to the final_report directory
CMD make && mv report.html final_report