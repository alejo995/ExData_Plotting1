library("dplyr")
library("tidyr")
library("lubridate")

data <- read.table("./course_project1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- as_tibble(data)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$new <- paste(data$Date, data$Time, sep =  )
data$new <- dmy_hms(data$new)
png("./course_project1/ExpDatWeek1/plot3.png", width = 480, height = 480, units = "px")

plot(data$Sub_metering_1 ~ data$new, type="l", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ data$new, type="l", xlab = "", col = "red")
lines(data$Sub_metering_3 ~ data$new, type="l", xlab = "", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), fill=c("black","red","blue"))
dev.off()
