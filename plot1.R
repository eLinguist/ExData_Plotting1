# Set local directory
setwd("C:/ML Kurs/Graphs")

# Load and transform data (keep only the Global_active_power for the two requested days)
Source <- "household_power_consumption.txt"
data <- read.table(Source, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data <- as.numeric(data$Global_active_power)

# Generate the .png graph
png("plot1.png", width=480, height=480)
hist(data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()