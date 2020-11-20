#ordenar datos por estacion
stations<-data[!duplicated(data$LocationID), ]
stations_ID<-stations$LocationID
for(i in stations_ID){
  dataID<-data%>%
    filter(LocationID==i)%>%
    select(Date, Characteristic, Value)%>%
    group_by(Date, Characteristic)%>%
    summarise(mean_value=mean(Value))%>%
    spread(Characteristic, mean_value)%>%
    arrange(Date)%>%
    separate(Date,into=c('Year', 'month','day'), sep="-", remove = TRUE)%>%
    select(-day)
  #  rename(DO=`Dissolved oxygen (DO)`)%>%
  #  rename(DN=`Nitrogen Dissolved`)%>%
  #  rename(TN=`Nitrogen Total`)%>%
  #  rename(DP=`Phosphate-phosphorus Dissolved`)%>%
  #  rename(TP=`Phosphate-phosphorus Total`)%>%
  #  rename(TW=`Temperature, water`)
  assign(paste0("data", i), dataID)
}
