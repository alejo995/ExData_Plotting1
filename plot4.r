library("dplyr")
library("tidyr")
library("lubridate")
#import data
data <- read.table("./course_project1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- as_tibble(data)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$new <- paste(data$Date, data$Time, sep =  )
data$new <- dmy_hms(data$new)
#open device
png("./course_project1/ExpDatWeek1/plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(5,4,1,1))
#first plot
plot(data$Global_active_power ~ data$new, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
#second plot
plot(data$Voltage ~ data$new, type="l", xlab = "datetime", ylab = "Voltaje")
#third plot
plot(data$Sub_metering_1 ~ data$new, type="l", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ data$new, type="l", xlab = "", col = "red")
lines(data$Sub_metering_3 ~ data$new, type="l", xlab = "", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), fill=c("black","red","blue"))
#final plot
plot(data$Global_reactive_power ~ data$new, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
