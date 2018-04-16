dataFile <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
dataFile$Date <- as.Date(dataFile$Date, format = "%d/%m/%Y")
dataSubset <- subset(dataFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dataSubset$DateTime <- strptime(paste(dataSubset$Date, dataSubset$Time), "%Y-%m-%d %H:%M:%S")
dataSubset$DateTime <- as.POSIXct(dataSubset$DateTime)

plot(Global_active_power ~ dataSubset$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()