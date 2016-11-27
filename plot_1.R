# Assumption : The required data file is present in the current working directory.

data_file <- "./household_power_consumption.txt"

dataset <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# Subset the data within given date range

plotting_data <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# change Global_active_power variable to numeric class.
global_active_power <- as.numeric(plotting_data$Global_active_power)

## Saving to png file
png(file="plot1.png", height=480, width=480)

# plot histogram
hist(global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency") 

dev.off()
