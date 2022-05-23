#Chart 3 answers the question of "Which artist types appear the most on the top charts?"

#Load ggplot and dplyr packages
library(dplyr)
library(tidyverse)
library(ggplot2)


#load in data from csv file
#url : https://www.kaggle.com/datasets/amey22/spotify-top-100-songs-of-2010-2019
decade_data <- read.csv("https://raw.githubusercontent.com/info201b-2022-spring/final-projects-jinnisi/main/data/Spotify%202010%20-%202019%20Top%20100.csv?token=GHSAT0AAAAAABTKJOZZNXW6BNKTALTWOOKOYULF2XQ")

#Create graph data
artist_sets <- decade_data %>%
  group_by(artist.type) %>%
  summarise(total = n()) %>%
  arrange(desc(total))

#Graph
graph <- ggplot(artist_sets, aes(artist.type, total)) +
  geom_bar(stat = "identity", fill = "blue") +
  geom_text(aes(label = total), size = 3, vjust = 0) +
labs(y = "Times Appeared on Charts", x = "Type of Artist") +
  ggtitle("Artist Types on Top Charts 2010-2019")

graph
rm(list = ls())








