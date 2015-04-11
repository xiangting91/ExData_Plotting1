##Import Data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Convert Date; make sure its capital %Y for YYYY
data_full$Date <- as.Date(data_full$Date, format= "%d/%m/%Y")

## Subset dates 2007-02-01 to 2007-02-02
data <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")

## Combine date and time to get continuous line

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Format Data
data$Global_active_power <- as.numeric(data$Global_active_power)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save as PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
