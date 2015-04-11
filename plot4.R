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


## Plot 4
par(mfrow=c(2,2))

        ## Plot 1
        plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

        ##Plot 2
        plot(data$Voltage~data$Datetime, type="l", xlab="datetime", ylab="Voltage")

        ##Plot 3
        plot(data$Sub_metering_1~data$Datetime, type="l", xlab="", ylab="Energy sub metering")
        lines(data$Sub_metering_2~data$Datetime,col='Red')
        lines(data$Sub_metering_3~data$Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

        ##Plot 4
        plot(data$Global_reactive_power~data$Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save as PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
