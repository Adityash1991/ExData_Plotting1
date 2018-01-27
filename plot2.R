# Saving data file path
dataFilePath <- "./data/household_power_consumption.txt"

#Saving household consumption data in variable data
data <- read.table(dataFilePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# convert
datetime_subset <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

numeric_globalActivePower <- as.numeric(subSetData$Global_active_power)

# Plot the graph
plot(datetime_subset, numeric_globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()


