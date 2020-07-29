{
  source(file="scripts/reference.R");  
  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                         stringsAsFactors = FALSE);
  
  # Putting four number sign at beginning and end of a line adds it to the "outline" 
  #### Part 1: Create a pressure level column ####
  
  # find the 20%, 40%, 60%, and 80% quantile values of "stnPressure" column
  # so, pressureQuant will be a vector with 4 values
  pressureQuant = quantile(weatherData$relHum,    
                           probs=c(.50));

  # the variable day will takes on values from 1 to 366
  # the for loop iterates for each value of day (so, 366 iterations)
  for(day in 1:nrow(weatherData))  
  {
    ## Creating a new column, called pressureLevel,
    #  that gives relative pressure for the day (based on the quantile results)
    
    # if the standard pressure of the day is less than or equal to the 0.20 quantile value
    if(weatherData$[day] <= pressureQuant[1])
    {
      weatherData$pressureLevel[day] = "Very Low";  # set the pressure to very low
    }
  #### Part 2: Boxplot of the wind speed vs pressure level ####
    theme_bw() +
    labs(title = "Wind Speeds vs. Pressure Levels",
         subtitle = "Lansing, Michigan: 2016",
         x = "Pressure Level",
         y = "Wind Speeds")  +
  plot(thePlot);
  
  ##### In-class application #### 
  #  Part 1: Practice with the breakpoints:  
  #    What is the breakpoint doing inside the for loops?
  #      note: you can add/remove breakpoints while debugging (especially useful when in for loops)
  #    Put it two (or more) breakpoints and use Continue
  #  Part 2: Humidity vs Precipitation boxplots
  #    Humidity goes on the y-axis
  #    Two boxes on the x-axis: (1) Days that had precip (2) Days that had no precip
  #    Use "weatherType" column to determine precipitation
  #      days with precip have either "RA" or "SN" in the "weatherType" column
  #    Break down the problem -- try to individually get "RA" and "SN" before trying to combine them
  
}  