# execute the lines of code from reference.r
source(file="scripts/reference.r");    

# read in CSV file and save the content to packageData
packageData = read.csv(file="data/CRANpackages.csv");
# read in the lines of code from reference.r
source(file="scripts/reference.r");    

# read in CSV file and save the content to packageData
packageData = read.csv(file="data/CRANpackages.csv");

plotData = ggplot( data=packageData ) + 
  geom_point( mapping=aes(x=Date, y=Packages) ); 
plot(plotData);
# same five lines of code without parameter names in the functions
source("scripts/reference.r");    
packageData = read.csv("data/CRANpackages.csv");

plotData = ggplot( packageData ) +
  geom_point( aes(Date, Packages) ); 
plot(plotData);
source(file="scripts/reference.r");    
packageData = read.csv(file="data/CRANpackages.csv");


plotData = ggplot( data=packageData ) + 
  geom_point( mapping=aes(x=Date, y=Packages) ) +
  ggtitle( label="Packages in CRAN (2001-2014)" ) +
  scale_y_continuous( breaks = seq(from=0, to=6000, by=500) ) +
  theme( axis.text.x=element_text(angle=90, hjust=1) );
plot(plotData);

##using ggsave to save images
ggsave(filename="images/lesson02.jpeg",
       plot - plotData,
       width = 12,
       height = 7,
       units - c("cm"))
##saving as PNG
ggsave(filename="images/PNGfiles/lesson02.png",
       plot = plotData,
       width = 6,
       height = 8,
       units = c("cm"))

       
