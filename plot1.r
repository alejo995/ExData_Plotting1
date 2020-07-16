library("dplyr")
library("tidyr")
library("lubridate")

data <- read.table("./course_project1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- as_tibble(data)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
png("./course_project1/ExpDatWeek1/plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
