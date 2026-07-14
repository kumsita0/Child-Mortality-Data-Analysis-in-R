# Child Mortality Data Analysis in R

## Overview

This project demonstrates data wrangling, exploratory data analysis, and visualization using R and the tidyverse.

The analysis uses child mortality rate data stored in an Excel workbook. The workflow includes importing data, transforming it into tidy format, creating summary statistics, and visualizing mortality trends across age groups.

---

## Objectives

- Import Excel data into R
- Transform wide data into tidy (long) format
- Create new variables using `mutate()`
- Rename variables
- Save and load data using RDS files
- Calculate grouped summary statistics
- Produce publication-quality line charts with ggplot2

---

## Dataset

**Source**

Child mortality rates dataset provided with the Murach R examples.

**Input file**

```
data/child_mortality_rates.xlsx
```

---

## Technologies

- R
- RStudio
- tidyverse
- readxl
- ggplot2
- dplyr
- tidyr

---

## Repository Structure

```
Child-Mortality-Data-Analysis/
│
├── data/
│   └── child_mortality_rates.xlsx
│
├── scripts/
│   └── child_mortality_analysis.R
│
├── output/
│   └── mortality_long.rds
│   
│
├── child_mortality_report.Rmd
└── child_mortality_report.html
├── ChildMortality.Rproj
├── README.md
└── .gitignore
```

---

## Analysis Workflow

1. Load required packages
2. Import Excel dataset
3. Explore the data
4. Transform data from wide to long format
5. Create derived variables
6. Save transformed data as an RDS file
7. Generate summary statistics
8. Visualize mortality trends by age group

---

## Required Packages

```r
install.packages(c(
  "tidyverse",
  "readxl"
))
```

---

## How to Run

1. Clone this repository.

```bash
git clone https://github.com/yourusername/Child-Mortality-Data-Analysis.git
```

2. Open

```
ChildMortality.Rproj
```

3. Install required packages.

4. Run

```
scripts/child_mortality_analysis.R
```

or knit

```
child_mortality_report.Rmd
```

to generate the HTML report.

---

## Example Output

The project produces:

- Summary statistics by decade
- Tidy dataset
- Line chart of mortality rates over time
- HTML report

---

## Author

Kumari Sita

Data Analysis with R
