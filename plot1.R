# Project 1 - Exploratory Data Analysis Course - Johns Hopkins University
# Rejane Rodrigues de Carvalho Pereira (15/11/2020, Brasília-DF, Brazil)
# Plot 1

library(data.table)
library(dplyr)
library(datasets)
library(graphics)

# Reading the file
data.table <- fread("household_power_consumption.txt", 
              na.strings = "?",  
              blank.lines.skip=TRUE)

# Filtering the dataset
data.table.subset <-
  data.table %>%
  filter(as.character(as.Date(data.table$Date, format="%d/%m/%Y")) 
         %in% c("2007-02-01", "2007-02-02")) 

# Generating the file
png(file = "plot1.png", width = 480, height = 480)

#Defining the position and the labels of the X axis
xval <- seq(0, 6, by=2)

#Defining the position and the labels of the Y axis
yval <- seq(0, 1200, by=200)

# Creating the histogram
with( data.table.subset, {
      hist(Global_active_power, 
           main="Global active Power",
           xlab="Global Active Power(kilowatts)",
           ylab="Frequency", col="red",
           axes = FALSE)
     axis(side=1, at= xval, labels = xval)
     axis(side=2, at= yval, labels = yval)})

# Closing the device                      
dev.off()