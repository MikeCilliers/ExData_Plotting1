## Coursera: Exploratory Data Analysis
## Course Project 1
## Developer: Mike Cilliers
## Date: 12 Oct 2014


setwd("~/R/workspace/exploreData")

suppressMessages(library(dplyr))

# Read the dataset: Electric power consumption
hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))
# get the Global active power records for the dates 2007-02-01 and 2007-02-02
gap <- hpc.tbl %>%
	filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(date_time = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>% 
	select(date_time, Global_active_power)
rm(hpc.tbl)

# plot the line graph as a png
png(filename="plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with(gap, plot(date_time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

rm(gap) 
