suppressMessages(library(dplyr))

setwd("~/R/workspace/exploreData")

hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))

sm <- hpc.tbl %>%
	filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(date_time = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>% 
	select(date_time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
rm(hpc.tbl)
png(filename="plot3.png")
with (sm, plot(date_time, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering")
	points(date_time, Sub_metering_2, type="l", col = "red")
	points(date_time, Sub_metering_3, type="l", col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

