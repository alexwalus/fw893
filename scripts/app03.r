source(file="scripts/reference.R");   # include the reference.r file
weatherData = read.csv(file="data/LansingNOAA2016.csv",
                       stringsAsFactors = FALSE);
plotData = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=windSpeed, y=abs(tempDept)), 
              color=rgb(red=0, green=0.6, blue=0.6), 
              size=2, 
              shape=18,
              alpha=.7) +
  theme_bw() +
  labs(title = "Wind Speed vs. Temperature Departure",
       subtitle = "Lansing, Michigan: 2016",
       x = "Speed (mph)",
       y = "Temperature Departure (F)") +
  theme(axis.title.x=element_text(size=10, color="orange2"),
        axis.title.y=element_text(size=10, color="red4"), 
        plot.title=element_text(size=16, face="bold", 
                                color ="blue"),
        plot.subtitle=element_text(size=12, face="bold.italic", 
                                   color ="darkblue", family="serif")) +
  geom_smooth( mapping=aes(x=windSpeed, y=abs(tempDept)), 
               method="lm",
               color="blue3", 
               size=1, 
               linetype=2, 
               fill="blue");
plot(plotData);
##this plot shoes the correlation between wind speed and temperature departure.
##It appears there is a slightly positive correlation between the two. 
ggsave(filename = "images/graph1.jpg", 
       plot = plotData) 