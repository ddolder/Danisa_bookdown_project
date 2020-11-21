#renombrar columnas
data4917450<-data4917450%>%
  rename(DO= 'Dissolved oxygen (DO)')%>%
  rename(DN='Nitrogen Dissolved')%>%
  rename(TN='Nitrogen Total')%>%
  rename(DP='Phosphate-phosphorus Dissolved')%>%
  rename(TP='Phosphate-phosphorus Total')%>%
  rename(Chla='Chlorophyll a Total')%>%
  rename(Turb='Turbidity')%>%
  rename(TDST='Total dissolved solids Total')%>%
  rename(TW='Temperature, water')


