#Chart 2: Danceabilty Vs. Energy in Songs

#Load ggplot and dyplr packages
library(ggplot2)
library(dplyr)
library(hrbrthemes)

#Load dataset
#url : https://www.kaggle.com/datasets/amey22/spotify-top-100-songs-of-2010-2019
decade_data <- read.csv("Spotify Top 100 Songs of 2010-2019.csv")


#Extract Dancebility and Energy to be used in final graph
x_value <- decade_data$nrgy
y_value <- decade_data$dnce
combine <- subset(data.frame(x_value, y_value,by="year"), select = -(by))
combine[is.na(combine)] <- 0

#Create graph data
graph <- combine %>% 
  group_by(x_value) %>% 
  summarise(danceability = sum(y_value))

#Create graph using data
danceability <- ggplot(graph, aes(x = x_value, y = danceability)) +
  labs(y = "Danceability", x = "Energy") +  
  geom_line(color = "black") +
  geom_point(shape = 20, color = "blue", size = 1) +
  ggtitle("Danceability Vs. Song Energy")


danceability  

