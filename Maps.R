
library(leaflet)
library(tidyverse)

data<-read_csv('data/utah_lake.csv')
ul<-data[!duplicated(data$Longitude), ]
ul%>%
  leaflet() %>%
  setView(lng=-111.83, lat=40.15, zoom=9)%>%
  addTiles()%>%
  addMarkers(lng = ~Longitude, lat= ~Latitude, popup= ~LocationID)
ul

