
data<-read_csv('data/utah_lake.csv')
data_orig<-data
#take off fractionto parameters that only have total fraction
data$char<-data$Characteristic=="Turbidity"
data$Fraction = ifelse(data$char==TRUE, NA, data$Fraction)
data = select (data,-c(char))
data$char<-data$Characteristic=="pH"
data$Fraction = ifelse(data$char==TRUE, NA, data$Fraction)
data = select (data,-c(char))
#join the chlorophyll-a
data$chla<-data$Characteristic=="Chlorophyll a, corrected for pheophytin"
data$Characteristic = ifelse(data$chla==TRUE,"Chlorophyll a",data$Characteristic)
data = select (data,-c(chla))
data$chla<-data$Characteristic=="Chlorophyll a, uncorrected for pheophytin"
data$Characteristic = ifelse(data$chla==TRUE,"Chlorophyll a",data$Characteristic)
data = select (data,-c(chla))
data$chla<-data$Characteristic=="Chlorophyll a, free of pheophytin"
data$Characteristic = ifelse(data$chla==TRUE,"Chlorophyll a",data$Characteristic)
data = select (data,-c(chla))
#add fraction to the parameter name
data$frac1<-data$Fraction==''
data$frac1 = ifelse(is.na(data$frac1), TRUE, FALSE)
data$frac2<-paste(data$Characteristic, data$Fraction)
data$Characteristic = ifelse(data$frac1==TRUE, data$Characteristic, data$frac2)
data = select (data,-c(frac1, frac2))
data<-data
#date format
data$Date = as.Date(data$Date, "%m-%d-%Y")
#count the number of parameters
param<-data[!duplicated(data$Characteristic), ]
total_param<-nrow(param)