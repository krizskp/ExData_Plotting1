dataFile <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
dataFile$Date <- as.Date(dataFile$Date, format = "%d/%m/%Y")
dataSubset <- subset(dataFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()