################# plot2.R ####################
# R script to create Plot2 in Week1 Assignment of Coursera Exploratory Data Analysis Course 
rm(list = ls()) # clear workspace


setwd("~/Documents/workspace/Coursera/Data_Science_Specialization/4 Exploratory Data Analysis/Assignments")
#### Step 1: Load data as table and name columns
consumption<-read.table("household_power_consumption.txt",header = FALSE, sep=";", skip = 66637, nrows=1440*2)
names(consumption)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")
#### Step 2: Convert Date & Time into Timestamp 
x <- paste(consumption$Date, consumption$Time)
consumption$Timestamp<-strptime(x, "%d/%m/%Y %H:%M:%S")

#### Step 3: Plot  & write to PNG file
par(mfrow=c(1,1))

with(consumption, plot(Timestamp,Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

     
dev.copy(png, file = "plot2.png")
dev.off()
