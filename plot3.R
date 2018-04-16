dataFile <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
dataFile$Date <- as.Date(dataFile$Date, format = "%d/%m/%Y")
dataSubset <- subset(dataFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dataSubset$DateTime <- strptime(paste(dataSubset$Date, dataSubset$Time), "%Y-%m-%d %H:%M:%S")
dataSubset$DateTime <- as.POSIXct(dataSubset$DateTime)

plot(Sub_metering_1 ~ dataSubset$DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ dataSubset$DateTime, col = "Red")
lines(Sub_metering_3 ~ dataSubset$DateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()