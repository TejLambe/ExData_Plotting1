# Assumption : The required data file is present in the current working directory.

data_file <- "./household_power_consumption.txt"

dataset <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# Subset the data within given date range

plotting_data <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# change Global_active_power variable to numeric class.
global_active_power <- as.numeric(plotting_data$Global_active_power)

#change variables to class numeric  Sub_metering_1, Sub_metering_2, Sub_metering_3
sub_metering_1 <- as.numeric(plotting_data$Sub_metering_1)
sub_metering_2 <- as.numeric(plotting_data$Sub_metering_2)
sub_metering_3 <- as.numeric(plotting_data$Sub_metering_3)

# Change date time variables to date time classes.

datetime <- strptime(paste(plotting_data$Date, plotting_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# change Voltager variable to numeric class.
voltage <- as.numeric(plotting_data$Voltage)

# change Global_reactive_power variable to numeric class.
global_reactive_power <- as.numeric(plotting_data$Global_reactive_power)

## Saving to png file
png(file="plot4.png", height=480, width=480)
par(mfrow = c(2, 2)) 


with(plotting_data, {
  plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(datetime, sub_metering_1, type="l", xlab="", ylab="Energy sub Metering")
  lines(datetime, sub_metering_2,type="l", col = "red")
  lines(datetime, sub_metering_3,type="l", col = "blue")
  legend("topright",lty =1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty = "n")
  
  plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")   
})

dev.off()