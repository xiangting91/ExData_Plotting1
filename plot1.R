##Import Data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Convert Date; make sure its capital %Y for YYYY
data_full$Date <- as.Date(data_full$Date, format= "%d/%m/%Y")

## Subset dates 2007-02-01 to 2007-02-02
data <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 1

hist(data$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Save as PNG
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
