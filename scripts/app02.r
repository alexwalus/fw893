rm(list=ls());                         # clear Console Window
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # include all GGPlot2 functions
# execute the lines of code from reference.r
source(file="scripts/reference.r");    

# read in CSV file and save the content to packageData
packageData = read.csv(file="data/accdeaths.csv");
# read in the lines of code from reference.r
source(file="scripts/reference.r");    

# read in CSV file and save the content to packageData
packageData = read.csv(file="data/accdeaths.csv");

plotData = ggplot( data=packageData ) + 
  geom_point( mapping=aes(x=time, y=accdeaths) ); 
plot(plotData);
source(file="scripts/reference.r");    
packageData = read.csv(file="data/accdeaths.csv");


plotData = ggplot( data=packageData ) + 
  geom_point( mapping=aes(x=time, y=accdeaths) ) +
  ggtitle( label="Accidental Deaths from 1973-1978" ) +
  scale_y_continuous( breaks = seq(from=7000, to=11000, by=2000) ) +
  scale_x_continuous( breaks = seq(from=1973, to=1979, by=.5) ) +
  theme( axis.text.x=element_text(angle=45, hjust=1) );
plot(plotData);