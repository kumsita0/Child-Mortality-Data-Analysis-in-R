# Install packages when using them for the first time
# install.packages("tidyverse")
# install.packages("Rcpp")            # necessary on some systems

# load the tidyverse packages
library("tidyverse")       # core packages
library("readxl")          # for reading Excel data

# NOTE: Set working directory to /murach_r/examples/ch03
# FROM MENUS: Session > Set Working Directory > To Source File Location

# read the spreadsheet into a tibble
mortality_data <- read_excel("child_mortality_rates.xlsx")

# view the tibble
mortality_data

# select rows from top or bottom
head(mortality_data)
tail(mortality_data, 3)

# view summary info for all columns
summary(mortality_data)

# select columns
select(mortality_data, Year)                 # selects the Year column
select(mortality_data, Year, "01-04 Years")  # selects two columns
select(mortality_data, -Year)                # selects all columns except Year

# view summary info for selected column
summary(select(mortality_data, "01-04 Years"))

# melt the columns to be plotted to create long data
mortality_data   # wide (messy)

mortality_long <- pivot_longer(mortality_data, 
                               cols = c("01-04 Years", "05-09 Years", "10-14 Years", "15-19 Years"),
                               names_to = "AgeGroup", values_to = "DeathRate")

mortality_long   # long (tidy)


# modify column for the death rate
mortality_long <- mutate(mortality_long, 
                         DeathRate = DeathRate * 100000)

# add column for the decade
mortality_long <- mutate(mortality_long, 
                         Decade = (Year %/% 10) * 10)

# combine the previous two statements into one
# mortality_long <- mutate(mortality_long, 
#                         DeathRate = DeathRate * 100000,
#                         Decade = (Year %/% 10) * 10)

# view the tibble
mortality_long

# rename the death rate column
mortality_long <- rename(mortality_long, DeathsPer100K = DeathRate)

# view the tibble
mortality_long

# save the tibble to an RDS file
saveRDS(mortality_long, "mortality_long.rds")

# read the tibble from an RDS file
mortality_long = readRDS("mortality_long.rds")

# calculate summary statistics for each decade
mortality_long %>% 
  group_by(Decade) %>% 
  summarize(MeanDeaths = mean(DeathsPer100K), 
            Count = n())

# create a line plot
ggplot(mortality_long, aes(x = Year, y = DeathsPer100K, color = AgeGroup)) +
  geom_line()

# How to generate figure 1-1
ggplot() +
  geom_line(data = mortality_long, 
            aes(x = Year, y = DeathsPer100K, color = AgeGroup)) +
  labs(y = "Deaths Per 100K") +
  guides(color = guide_legend(title = "Age Group")) + 
  geom_segment(aes(x = 1918, y = 1590, xend = 1918, yend = 1700)) +
  geom_label(aes(x = 1918, y = 1700, label = "1918 Spanish Flu"))
