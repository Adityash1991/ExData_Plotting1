# Saving data file path
dataFilePath <- "./data/household_power_consumption.txt"

#Saving household consumption data in variable data
data <- read.table(dataFilePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert date time
datetime_subset <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert sub metering 
numeric_subMetering1 <- as.numeric(subSetData$Sub_metering_1)
numeric_subMetering2 <- as.numeric(subSetData$Sub_metering_2)
numeric_subMetering3 <- as.numeric(subSetData$Sub_metering_3)


numeric_globalActivePower <- as.numeric(subSetData$Global_active_power)
numeric_globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
numeric_voltage <- as.numeric(subSetData$Voltage)

par(mfrow = c(2, 2)) 

#plot 1
plot(datetime_subset, numeric_globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot 2
plot(datetime_subset, numeric_voltage, type="l", xlab="datetime", ylab="Voltage")

#plot 3
plot(datetime_subset, numeric_subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime_subset, numeric_subMetering2, type="l", col="red")
lines(datetime_subset, numeric_subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#plot 4
plot(datetime_subset, numeric_globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
