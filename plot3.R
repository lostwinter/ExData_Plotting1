# Exploratory Analysis: Project One.
# Load data. Date range: 2007-02-01 and 2007-02-02
# Convert the Date and Time variables to Date/Time classes using strptime() and as.Date().
# fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# plot1.png and plot1.R etc

##############################################################
# Load and Convert
##############################################################
# Read in
dataAll <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dataAll$Date <- as.Date(dataAll$Date, format="%d/%m/%Y")

# Subset
myData <- subset(dataAll, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataAll)

# Convert dates and times
datesTimes <- paste(as.Date(myData$Date), myData$Time)
myData$datesTimes <- as.POSIXct(datesTimes)

##############################################################
#Plot 3: Energy metering (y) by day Thu-Sat (x)
##############################################################
with(myData, {plot(Sub_metering_1~datesTimes, type="l",
                   ylab="Global Active Power (kilowatts)", xlab="")
              lines(Sub_metering_2~datesTimes,col='Red')
              lines(Sub_metering_3~datesTimes,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


##############################################################
#End
##############################################################
