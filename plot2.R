suppressMessages(library(dplyr))

setwd("~/R/workspace/exploreData")

hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))

gap <- hpc.tbl %>%
	filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(date_time = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>% 
	select(date_time, Global_active_power)
rm(hpc.tbl)
png(filename="plot2.png")
with(gap, plot(date_time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() 
