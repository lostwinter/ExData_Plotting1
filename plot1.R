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
#Plot 1: Frequency (y) of global active power by kilowatts (x)
##############################################################
hist(myData$Global_active_power, main="Global Active Power", col="Red", ylab="Frequency", xlab="Global Active Power (kilowatts)")
# Save as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

##############################################################
#End
##############################################################
