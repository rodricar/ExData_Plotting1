# Project 1 - Exploratory Data Analysis Course - Johns Hopkins University
# Rejane Rodrigues de Carvalho Pereira (15/11/2020, Brasília-DF, Brazil)
# Plot 2

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
png(file="plot2.png",width=480,height=480)

# Creating the plot
with(data.table.subset, {
     plot(Date.Time,
          Global_active_power,
          xlab = "",
          ylab ="Global Active Power(kilowatts)",
          type = "l")
      })
          
# Closing the device                      
dev.off()