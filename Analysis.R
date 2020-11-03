library(tidyverse)
data<-read_csv('data/utah_lake.csv')

#agregar fraccion al parametro
data$Characteristic = paste(data$Characteristic, data$Fraction)
data$Date = as.Date(data$Date, "%m/%d/%Y")

#ordenar datos por estacion
data_310<-data%>%
  filter(LocationID==4917310)%>%
  select(Date, Characteristic, Value)%>%
  group_by(Date, Characteristic)%>%
  summarise(mean_value=mean(Value))%>%
  spread(Characteristic, mean_value)%>%
  arrange(Date)%>%
  separate(Date,into=c('Year', 'month','day'), sep="-", remove = FALSE)%>%
  select(-day)


#cambiar nombres columnas
data_310%>%
  rename(DO=`Dissolved oxygen (DO) NA`)%>%
  rename(DN=`Nitrogen Dissolved`)%>%
  rename(TN=`Nitrogen Total`)%>%
  rename(DP=`Phosphate-phosphorus Dissolved`)%>%
  rename(TP=`Phosphate-phosphorus Total`)%>%
  rename(TW=`Temperature, water NA`)
  

ggplot(data_310,aes(x= Date, y=`Nitrogen Dissolved`)) +
  geom_point()
 
