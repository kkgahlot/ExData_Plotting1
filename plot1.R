#
# Exploratory Data Analysis Week 1 Assignment
#
# Read “Individual household electric power consumption Data Set” and plot
# various data in required format.
#

# Read data. Assume data file is present in current directory.
powerData <- read.csv("household_power_consumption.txt", 
                      sep = ";",
                      stringsAsFactors = FALSE,
                      na.strings = "?")

# Convert Date column into Data format
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")

# We are interested in data of only two days, 2007-02-01 and 2007-02-02
# So subset the data using that condition.
powerData <- subset(powerData, Date == "2007-02-01" | Date == "2007-02-02")

# Create a timestamp value by merging Date and Time columns.
powerData$datetime <- paste(powerData$Date, powerData$Time, sep = " ")
powerData$datetime <- strptime(powerData$datetime, 
                               format = "%Y-%m-%d %H:%M:%S")

# Plot1 : Histogram of "Global Active Power"
png(filename = "plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power(killowatts)")
dev.off()
