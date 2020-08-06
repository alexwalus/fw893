##### Assignment:
# - Make a copy of the above plot using annotate()
# - add a line to represent the mean value for each box
# - add text to represent the standard deviations for each box
# - get *one box* working fully before trying the second
# - Challenge: get both boxes working with a for loops: for(i in 1:2) ...

##### To manually get data for boxplots (don't read if you want a challenge)
# 1) get all relHum values for days where there is no precipitation
#    one way: weatherData$relHum[weatherData$precipitation==0]
# 2) get the mean, median, and standard deviation for the data from #1
# 3) find the 1st and 3rd quartile (0.25 and 0.75 quantile) 
#    of the data using quantile() 
# 4) solve for interquartile range (IQR -- the box height): 
#    IQR = 3rd quartile - 1st quartile
# 5) solve for extreme whisker ends: 
#    - high: (3rd quartile) + 1.5*IQR
#    - low: (1st quartile) - 1.5*IQR
# 6) Solve for actual whisker end:
#    - high: the highest value in the data less than the high whisker value
#    - low: the lowest value in the data greater than the low whisker value
# 7) Repeat 1-6 for relHum values for days where there is precipitation


{
  source(file="scripts/reference.R");  
  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                         stringsAsFactors = FALSE);
  
  #### Create a column the give whether there was precipitation
  
  #### grepl produces a Boolean vector the same length as the data: 
  #      values are TRUE if they contain RA or SN, FALSE otherwise
  daysWithPrecip = grepl(x=weatherData$weatherType, pattern="RA|SN");
  
  # days will take values from 1 to 366 (the number of rows)
  for(day in 1:nrow(weatherData))  
  {
    if(daysWithPrecip[day] == TRUE)  # day had either RA or SN
    {
      weatherData$precipitation[day] = 1;   # set precip to 1
    }
    else   # day had neither RA nor SN
    {
      weatherData$precipitation[day] = 0;   # set precip to 0
    }
  }
  
  # GGPlot cannot factor a numeric column -- need to convert column to string (characters)
  weatherData$precipitation = as.character(weatherData$precipitation);
  
  # Original boxplot to replicate
  annotate(plot1 = ggplot(data=weatherData) +   
    geom_boxplot(mapping=aes(x=precipitation, y=relHum)) +
    theme_bw() +
    scale_x_discrete(labels=c("No Precip", "Precip")) +  
    labs(title = "Relative Humidity vs. Precipitation",
         subtitle = "Lansing, Michigan: 2016",
         x = "Precipitation",
         y = "Humidity"),
  plot(plot1));
}