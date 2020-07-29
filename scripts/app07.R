source( file="scripts/reference.R" ); 
weatherData = read.csv( file="data/LansingNOAA2016-3.csv", 
                        stringsAsFactors = FALSE );
relHumidityQuant = quantile(weatherData$relHum, probs=c(.30, .70));
for(day in 1:nrow(weatherData))  # nrow(weatherData) = 366
{
  # if the value in windSpeed is less than or equal to the low quant value⤷
  if(weatherData$relHum[day] <= relHumidityQuant[1])      # <= 6.4
  {
    weatherData$HumidityLevel[day] = "Low";
  }
  # if the value in windSpeed is greater than or equal to the high quant value⤷
  else if(weatherData$relHum[day] >= relHumidityQuant[2]) # >= 10.2
  {
    weatherData$HumidityLevel[day] = "High";
  }
  else # the value in windSpeed is between 6.2 and 10.4
  {
    weatherData$HumidityLevel[day] = "Medium";
  }
}
#### Part 1: A different way to arrange x-axis values
windLabels = c(Low = "Light Winds",
               Medium = "Medium Winds",
               High = "Strong Winds");
thePlot = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=HumidityLevel, y=stnPressure, fill=windDir),
               na.rm=TRUE) +
  scale_x_discrete(limits=c("Low", "Medium", "High")) +
  facet_grid(facets=.~factor(windSpeedLevel,
                             levels=c("Low", "Medium", "High")),
             labeller=as_labeller(windLabels)) +
theme_bw() +
  labs(title = "Change in Humidity vs Pressure",
       subtitle = "Lansing, Michigan: 2016",
       x = "Humidity Levels",
       y = "Pressure", 
       fill = "Wind Direction");
plot(thePlot);

####Create a script file in your GGPlot Class Project called app07.r. 
#Create a vector that holds the quantile values for the 30th and 70th percentile of relHumidity.
#Using the quantile values, create a new column called humidityLevel that creates three levels for relHumidity
#Create a boxplot of stnPressure vs humidityLevel
#Put humidityLevel in order of increasing humidity
#Add windDir as a fill to the boxplot
#Change order of windDir to North - East - South - West
#Add a horizontal facet (along the x-axis) using windSpeedLevel######