## Coursera: Exploratory Data Analysis
## Course Project 1
## Developer: Mike Cilliers
## Date: 12 Oct 2014


setwd("~/R/workspace/exploreData")

suppressMessages(library(dplyr))

# Read the dataset: Electric power consumption
hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))
#Filter only the data having dates 2007-02-01 and 2007-02-02 and select the relevant fields
hpc.tbl <- hpc.tbl %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(date_time = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>% 
	select(date_time, Global_active_power, Voltage, Global_reactive_power, Sub_metering_1, Sub_metering_2, Sub_metering_3)
	
#Plot the 4 base plots
png(filename="plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow = c(2, 2))
with(hpc.tbl, {
	plot(date_time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
	plot(date_time, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
		with (hpc.tbl, plot(date_time, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering"))
		with (hpc.tbl, points(date_time, Sub_metering_2, type="l", col = "red"))
		with (hpc.tbl, points(date_time, Sub_metering_3, type="l", col = "blue"))
		legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(date_time, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()	

rm(hpc.tbl)
