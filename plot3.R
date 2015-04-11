##Import Data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Examine Data
head(data_full)

##Convert Date; make sure its capital %Y for YYYY
data_full$Date <- as.Date(data_full$Date, format= "%d/%m/%Y")

## Subset dates 2007-02-01 to 2007-02-02
data <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data_full)

## Combine date and time to get continuous line

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
plot(data$Sub_metering_1~data$Datetime, type="l", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save as PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
