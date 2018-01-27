
# Saving data file path
dataFilePath <- "./data/household_power_consumption.txt"

#Saving household consumption data in variable data
data <- read.table(dataFilePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

numeric_globalActivePower <- as.numeric(subSetData$Global_active_power)

#plot the graph
hist(numeric_globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)

dev.off()



