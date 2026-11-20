# 1. 
x <- seq(15.2, 45.7, 0.56)
x [seq(1, length(x), by = 5)]

# 2.

glimpse(airquality)

AirTemp <- airquality["Temp"]

# 3. 

airquality %>%
  mutate(Weather = case_when(
    Temp < 70 ~ "cold",
    Temp >= 70 ~ "hot"
  ))

#Bonus
library(help = "datasets")

