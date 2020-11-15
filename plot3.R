# Project 1 - Exploratory Data Analysis Course - Johns Hopkins University
# Rejane Rodrigues de Carvalho Pereira (15/11/2020, Brasília-DF, Brazil)
# Plot 3

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
  filter(as.character(as.Date(data.table$Date, 
                                   format="%d/%m/%Y"))
         %in% c("2007-02-01", "2007-02-02"))  %>%
  mutate(Date.Time = strptime(paste(Date,Time, sep= " "),
                                format="%d/%m/%Y %H:%M:%S")) 

# Generating the file
png(file="plot3.png",width=480,height=480)

#Defining the position and the labels of the Y axis
yval <- seq(0, 30, by=10)

# Creating the plot
par(col="black")
with(data.table.subset, {
     plot(Date.Time,
          Sub_metering_1,
          xlab = "",
          ylab ="Energy sub metering",
          yaxt = "n",
          type = "l")
     # Labels Y axis
     axis(side=2, at= yval, labels = yval)
     # Add two lines
     lines(Date.Time, Sub_metering_2, col = "red")
     lines(Date.Time, Sub_metering_3, col = "blue")
     # Add legend
     par(col="black")
     legend("topright", lty = 1, col = c("black", "red", "blue"),
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            xjust = 1)
     })

          
# Closing the device                      
dev.off()