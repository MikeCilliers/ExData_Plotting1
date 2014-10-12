## Coursera: Exploratory Data Analysis
## Course Project 1
## Developer: Mike Cilliers
## Date: 12 Oct 2014


setwd("~/R/workspace/exploreData")

suppressMessages(library(dplyr))
# Read the dataset: Electric power consumption 
hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))
#Filter only the data having dates 2007-02-01 and 2007-02-02
hpc.tbl <- hpc.tbl %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
# plot the histogram as a png
png(filename="plot1.png")
hist(hpc.tbl$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off() 
