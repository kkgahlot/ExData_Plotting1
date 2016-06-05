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

# Plot4 : Four different plots in 2 by 2 grid
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(powerData, plot(datetime,
                     Global_active_power,
                     type = "l",
                     xlab = "",
                     ylab = "Global Active Power"))

with(powerData, plot(datetime,
                     Sub_metering_1,
                     type = "n", 
                     xlab = "", 
                     ylab = "Energy sub metering"))
with(powerData, lines(datetime, Sub_metering_1, col="black"))
with(powerData, lines(datetime, Sub_metering_2, col="red"))
with(powerData, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1))

with(powerData, plot(datetime,
                     Voltage,
                     type = "l",
                     xlab = "datetime",
                     ylab = "Voltage"))

with(powerData, plot(datetime,
                     Global_reactive_power,
                     type = "l",
                     xlab = "datetime",
                     ylab = "Global_reactive_power"))
dev.off()

