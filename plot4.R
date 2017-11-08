# Set local directory
setwd("C:/ML Kurs/Graphs")

# Load and transform data (keep only the Global_active_power for the two requested days)
Source <- "household_power_consumption.txt"
data <- read.table(Source, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dataPeriod <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dataGAP <- as.numeric(data$Global_active_power)

# Generate the .png graph
Voltage <- as.numeric(data$Voltage)
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dataPeriod, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dataPeriod, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dataPeriod, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dataPeriod, Sub_metering_2, type="l", col="red")
lines(dataPeriod, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dataPeriod, dataGAP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()