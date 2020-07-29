  source(file="scripts/reference.R");  
  weatherData = read.csv(file="data/LansingNOAA2016-3.csv", 
                         stringsAsFactors = FALSE);
  
  #### Part 1: Create a wind direction column
  pressureQuant = quantile(weatherData[,"stnPressure"], 
                           probs=c(.20,.40, .60, .80));
  
  for(day in 1:nrow(weatherData))
  {
    ## Adding a column that gives relative wind speed for the day
    # Winds less than 6.4 miles/hour -- label as "Low"
    if(weatherData[day,"stnPressure"] <= pressureQuant[1])
    {
      weatherData[day,"pressureLevel"] = "Very Low";
    }
    # Winds greater than 10.2 miles/hour -- label as "High"
    else if(weatherData[day,"stnPressure"] <= pressureQuant[2])
    {
      weatherData[day,"pressureLevel"] = "Low";
    }
    else if(weatherData[day,"stnPressure"] <= pressureQuant[3])
    {
      weatherData[day,"pressureLevel"] = "Medium";
    }
    else if(weatherData[day,"stnPressure"] <= pressureQuant[4])
    {
      weatherData[day,"pressureLevel"] = "High";
    }
    else
    {
      weatherData[day,"pressureLevel"] = "Very High";
    }
  }
  #### Part 2: Plot Wind Speed vs. wind direction
  thePlot = ggplot(data=weatherData) +
    geom_boxplot(mapping=aes(x=pressureLevel, y=windSusSpeed)) +
    theme_bw() +
    labs(title = "Change in Wind Speed vs. Pressure Level",
         subtitle = "Lansing, Michigan: 2016",
         x = "Pressure Level",
         y = "Wind Speed");
  plot(thePlot);
  thePlot = ggplot(data=weatherData) +
    stat_boxplot(mapping=aes(x=pressureLevel, y=windSusSpeed)),
                 na.rm=TRUE,
                 geom = "errorbar",
                 width = 0.2) +
    geom_boxplot(mapping=aes(x=windDirFact, y=changeMaxTemp),
                 na.rm=TRUE,
                 outlier.shape = "@", 
                 outlier.color = "red",
                 outlier.alpha = 0.6, 
                 outlier.size = 4 ) +
    theme_bw() +
    labs(title = "Change in Wind Speed vs. Pressure Level",
         subtitle = "Lansing, Michigan: 2016",
         x = "Pressure Level",
         y = "Wind Speed");
  plot(thePlot);