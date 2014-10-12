## Coursera: Exploratory Data Analysis
## Course Project 1
## Developer: Mike Cilliers
## Date: 12 Oct 2014


setwd("~/R/workspace/exploreData")

suppressMessages(library(dplyr))

# Read the dataset: Electric power consumption
hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))

# get the "Sub metering" records for the dates 2007-02-01 and 2007-02-02
sm <- hpc.tbl %>%
	filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(date_time = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>% 
	select(date_time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
rm(hpc.tbl)

# plot the 3 line graphs for Sub metering onto one axis as a png
png(filename="plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with (sm, plot(date_time, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering")
	points(date_time, Sub_metering_2, type="l", col = "red")
	points(date_time, Sub_metering_3, type="l", col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
dev.off()

rm(sm)
