suppressMessages(library(dplyr))

setwd("~/R/workspace/exploreData")

hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))
#•We will only be using data from the dates 2007-02-01 and 2007-02-02
hpc.tbl <- hpc.tbl %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

png(filename="plot1.png")
hist(hpc.tbl$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off() 


as.POSIXct(paste(x$date, x$time), format="%Y-%m-%d %H:%M:%S")

