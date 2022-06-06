library(tidyverse)
library(tidyr)
library(dplyr)

decade_data <- read.csv("Spotify Top 100 Songs of 2010-2019.csv")

Attributes <- decades_data %>%
  group_by(COL) %>%
  summarise_all(sum)

Attributes <- Attributes %>%
  rename(
    tempo = bpm,
    energy = nrgy,
    pop = pop,
    acoustics = acous,
    happiness = val,
    liveness = live,
    dance = dnce,
    decibal = dB,
    duration = dur
  )


decade_data <- tempo %>%
  group_by(Country) %>%
  select(Happiness.Score, Happiness.Rank)

min_emergency_fs_city <- emergency_food_by_city %>%
filter(num_food_sources == min(num_food_sources)) %>%
pull(Location_Name)

covid_data_to_fs_by_city <- covid_data %>%
select(Location_Name, Positives, Deaths) %>%
filter(Location_Name != "All King County") %>%
mutate(Location_Name = str_trim(Location_Name))

combined_data <- left_join(emergency_food_by_city, 
covid_data_to_fs_by_city, 
by = "Location_Name") %>% 
filter(Positives != is.nan(Positives)) %>%
filter(Location_Name != is.nan(Deaths)) %>%
filter(num_food_sources != is.nan(num_food_sources)) %>%
mutate(deaths_per_fs = round(Deaths / num_food_sources)) %>%
mutate(positives_per_fs = round(Positives / num_food_sources))

max_deaths_per_fs_city <- combined_data %>% 
filter(deaths_per_fs == max(deaths_per_fs)) %>%
pull(Location_Name)

min_deaths_per_fs_city <- combined_data %>% 
filter(deaths_per_fs == min(deaths_per_fs)) %>%
pull(Location_Name)