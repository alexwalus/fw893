####Create a script file in your GGPlot Class Project called app08.r.
#Create a bar plot of Cooling Days (coolDays) for each month
#Add a title, and put appropriate labels on the axes.
#Change the bar width to 0.6
#Create a vector that consists of the first two values in the weatherType column (i.e., the new vector will have at most one weather condition for the day).
#Use the vector created in the previous step to fill the bars (for fun, you can try to just use weatherType as the fill and see what happens...)
#Customize the colors of the 8 weather conditions (one of the conditions is empty).  Do this using component scale_fill_manual and the subcomponent values, which will be set a to a vector.  Note: this is the discrete version of the component scale_fill_gradient.

source( file="scripts/reference.R" ); 
weatherData = read.csv( file="data/LansingNOAA2016-3.csv", 
                        stringsAsFactors = FALSE );
#### Part 2: Plot the precipitation for each season
thePlot = ggplot(data=weatherData) +
  geom_col(mapping=aes(x=season, y=coolDays), 
           width=0.6) +
  theme_bw() +
  labs(title = "Cool Days by Month",
       subtitle = "Lansing, Michigan: 2016",
       x = "Season",
       y = "Cool Days");
plot(thePlot);
#### Part 3: Creating a month column in the data frame
dates = as.Date(weatherData$dateYr);  # save the date column to a vector
months = format(dates, format="%b");  # extract the month -- save to vector
weatherData$month = months;           # save months to data frame as new column

# The above three lines could be written as:
# weatherData$month = format.Date(weatherData$dateYr, format="%b");
wType = weatherData$weatherType

# save only the first two characters in the weatherType
wType = substr(wType, start = 1, stop = 2);

# put in value of "--" for wType that have no value 
wType[which(wType=="")] = "--";

#### Part 4: Plot precipitation for each month
thePlot = ggplot(data=weatherData) +
  geom_col(mapping=aes(x=month, y=coolDays, fill=wType),
           width=0.6) +
  scale_x_discrete(limits = month.abb) +
  scale_fill_manual(values = c('red', 'orange', 'yellow', 'green', 
                               'blue', 'violet', 'purple', 
                               'pink')) +
  theme_bw() +
  labs(title = "Cool Days by Month",
       subtitle = "Lansing, Michigan: 2016",
       x = "Season",
       y = "Cool Days");
plot(thePlot);


#Create a bar plot of Heating Days (heatDays) for each month
thePlot = ggplot(data=weatherData) +
  geom_col(mapping=aes(x=season, y=heatDays), 
           width=0.6) +
  theme_bw() +
  labs(title = "Heat Days by Month",
       subtitle = "Lansing, Michigan: 2016",
       x = "Season",
       y = "Heat Days");
plot(thePlot);
#### Part 3: Creating a month column in the data frame
dates = as.Date(weatherData$dateYr);  # save the date column to a vector
months = format(dates, format="%b");  # extract the month -- save to vector
weatherData$month = months;   

#Add a title, and put appropriate labels on the axes.
#Change the bar width to 0.6
#Create a vector that consists of the first two values in the weatherType column.
wType = weatherData$weatherType

# save only the first two characters in the weatherType
wType = substr(wType, start = 1, stop = 2);

# put in value of "--" for wType that have no value 
wType[which(wType=="")] = "--";

sumCoolDays = sum(weatherData$coolDays);
#### Part 4: Plot precipitation for each month
thePlot = ggplot(data=weatherData) +
  geom_col(mapping=aes(x=month, y=heatDays, fill=wType),
           width=0.6) +
  scale_x_discrete(limits = month.abb) +
  scale_fill_manual(values = c('red', 'orange', 'yellow', 'green', 
                               'blue', 'violet', 'purple', 
                               'pink')) +
  geom_hline(mapping = aes( yintercept = sumCoolDays ),
             color="red", 
             size=1.5, 
             linetype=2) +
  theme_bw() +
  labs(title = "Heat Days by Month",
      subtitle = "Lansing, Michigan: 2016",
      x = "Month",
      y = "Heat Days");
plot(thePlot);

##this plot shows that winter months had the highest number of
##weather events. zI

#Add a horizontal line to the plot that represent the sum of all coolDays for the year (it should be in the 800s)

#Add a label (or, annotate) that describes what the line represents.
#Combine Heating and Cooling Days into one barplot
#Add a title, and put appropriate labels on the axes.
#Change the bar widths of both to 0.4
#Change the bar fill to solid colors: red for heatDays , blue for coolDays
thePlot = ggplot(data=weatherData) +
  geom_col(mapping=aes(x=month, y=heatDays),
           fill = "red",
           width=0.4,
           position=position_nudge(after_stat(x=0.3))) +
  geom_col(mapping=aes(x=month, y=coolDays),  
           fill = "blue",
           width=0.4,
           position=after_stat(position_nudge(x=0.3))) +
  scale_x_discrete(limits = month.abb) +
  theme_bw() +
  labs(title = "Heating and Cooling Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Month",
       y = "Cumulative Degrees (F)");
plot(thePlot);