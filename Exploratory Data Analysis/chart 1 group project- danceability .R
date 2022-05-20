#Chart 1 Most Important Factors in the Dancebility of Songs from 2010-2019

#Load ggplot and dplyr packages
library(dplyr)
library(tidyverse)
library(ggplot2)


#load the data
decade_data <- read.csv("/Users/alextran/Documents/info 201/Group project/final-projects-jinnisi/data/Spotify 2010 - 2019 Top 100.csv")


#create new dataframe 
attributes <- decade_data %>%
  summarize(tempo = bpm, energy = nrgy, pop = pop, acoustics = acous, happiness = val, liveness = live) %>%
  select(tempo, energy, pop, acoustics, happiness, liveness) %>%
  gather(key = top.year, value = dnce)
  
#create bar graph showing the danceability based on musical qualities 
dance_graph <- ggplot(data = attributes) +
  geom_bar(mapping = aes(x = dnce, y = top.year), stat = "identity", fill = "blue") +
  scale_fill_discrete(labels = "beats per minute", "energy", "decibel") +
  labs(y = "Musical Factors", x = "Danceability") +
  ggtitle("Danceability of Music Attributes from 2010-2019")

dance_graph  


