source(file="scripts/reference.R");                                       
weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                       stringsAsFactors = FALSE);
#### Part 1: Add year to date values ####
# a) save the date vector from the data frame to the variable theDate
theDate = weatherData$date;         # get all values from the dates column
# theDate = weatherData[["date"]];  # equivalent to previous line
# theDate = weatherData[ , "date"]; # equivalent to previous 2 lines in base R
# append (paste) "-2016" to all values in theDate
theDate = paste(theDate, "-2016", sep="");   
# theDate = paste(theDate, "2016", sep="-");  # functionally equivalent to the previous line
# c) Save the values in Date format
theDate = as.Date(theDate, format="%m-%d-%Y");
# d) Save theDate back to the data frame as a new column
weatherData$dateYr = theDate;
convert_fahr_to_celsius <- function(temp) {
  celsius <- ((temp - 32) * (5 / 9))
  return(celsius)
}
# C = ( 5/9 ) * F - 32
theTemp = weatherData$maxTemp;
maxtemp = convert_fahr_to_celsius(weatherData$maxTemp)
mintemp = convert_fahr_to_celsius(weatherData$minTemp)
avgtemp = convert_fahr_to_celsius(weatherData$avgTemp)
plotData = ggplot(data=weatherData) + 
  geom_line(mapping=aes(x=dateYr, y=maxtemp),
            color="palevioletred1") +
  geom_line(mapping=aes(x=dateYr, y=mintemp),
            color="aquamarine2") +
  geom_smooth(mapping=aes(x=dateYr, y=avgtemp),
              color="orange", 
              method="loess",
              linetype=4,
              fill="lightblue") +
  labs(title = "Temperature vs. Date",
       subtitle = "Lansing, Michigan: 2016",
       x = "Date",
       y = "Temperature (C)") +
  theme(panel.background = element_rect(fill="grey25",
                                        size=2, color="grey0"),
        panel.grid.minor = element_line(color="grey50", linetype=4),
        plot.title = element_text(hjust = 1.0),
        plot.subtitle = element_text(hjust = 1.0),
        axis.text.x = element_text(color="red", family="mono", size=9),
        axis.text.y = element_text(color="blue", family="mono", size=9)) +
  scale_y_continuous(limits = c(-10,40),
                     breaks = seq(from=-5, to=45, by=15)) +
  scale_x_date(limits=c(as.Date("2016-03-21"), 
                        as.Date("2016-09-21")),
               date_breaks = "8 weeks", 
               date_labels = format("%b/%d/%Y"));
plot(plotData);