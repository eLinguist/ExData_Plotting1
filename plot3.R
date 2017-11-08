# Set local directory
setwd("C:/ML Kurs/Graphs")

# Load and transform data (keep only the Global_active_power for the two requested days)
Source <- "household_power_consumption.txt"
data <- read.table(Source, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dataPeriod <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dataGAP <- as.numeric(data$Global_active_power)

# Generate the .png graph
png("plot2.png", width=480, height=480)
plot(dataPeriod, dataGAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()