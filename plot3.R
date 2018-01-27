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

#Plot the graph
plot(datetime_subset, numeric_subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime_subset, numeric_subMetering2, type="l", col="red")
lines(datetime_subset, numeric_subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()