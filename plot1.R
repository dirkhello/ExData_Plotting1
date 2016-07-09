################# plot1.r ####################
# R script to create Plot1 in Week1 Assignment of Coursera Exploratory Data Analysis Course 
rm(list = ls()) # clear workspace


setwd("~/Documents/workspace/Coursera/Data_Science_Specialization/4 Exploratory Data Analysis/Assignments")
#### Step 1: Load data as table and name columns
consumption<-read.table("household_power_consumption.txt",header = FALSE, sep=";", skip = 66637, nrows=1440*2)
names(consumption)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")

#### Step 2: Convert Date & Time into Timestamp (not needed for Plot1)
x <- paste(consumption$Date, consumption$Time)
consumption$Timestamp<-strptime(x, "%d/%m/%Y %H:%M:%S")

#### Step 3: Plot Histogram & write to PNG file
hist(consumption$Global_active_power,col = "red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
