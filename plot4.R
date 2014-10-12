setwd("~/R/workspace/exploreData")
suppressMessages(library(dplyr))

hpc.tbl <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?"))

hpc.tbl <- hpc.tbl %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(date_time = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>% 
	select(date_time, Global_active_power, Voltage, Global_reactive_power, Sub_metering_1, Sub_metering_2, Sub_metering_3)
	
png(filename="plot4.png")
par(mfrow = c(2, 2))
with(hpc.tbl, {
	plot(date_time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
	plot(date_time, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
	plot(date_time, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering")
		points(date_time, Sub_metering_2, type="l", col = "red")
		points(date_time, Sub_metering_3, type="l", col = "blue")
		legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(date_time, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()	

