##Read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Set up variables
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
VoltageData <- as.numeric(subSetData$Voltage)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

#Create png file
png("plot4.png", width=480, height=480)

#Set table 2 x 2
par(mfcol = c(2, 2))

#Print plot 2
plot(datetime, globalActivePower, type = "l", xlab=" ", ylab = "Global Active Power (Kilowatts)", main = " ")

#Print plot 3
plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", lty=1, lwd=2.5, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Print remaining plots
plot(datetime, VoltageData, type = "l", xlab="datetime", ylab = "Voltage", main = " ")
plot(datetime, globalReactivePower, type = "l", xlab="datetime", ylab = "Global_reactive_power", main = " ")
dev.off()