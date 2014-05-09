## Plot4

## File household_power_consumption.txt containg data should
## be in your current working directory or you can set where 
## file is located using setwd() command

hpcFile = "household_power_consumption.txt"

## validation to check whether household_power_consumption.txt file exits

if(!file.exists(hpcFile))
{
  message("the household_power_consumption file does not exists")
}
hpcData <- read.table(hpcFile, header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)
hpcDataSubset <- hpcData[hpcData$Date %in% c("1/2/2007","2/2/2007") ,]

date <- as.character(as.Date(hpcDataSubset$Date, "%d/%m/%Y"))
x <- paste(date, hpcDataSubset$Time)
dateTime <- strptime(x, "%Y-%m-%d %H:%M:%S")

## prepare plot4.png
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2)) 

## plot for Global Active Power
plot(dateTime, as.numeric(hpcDataSubset$Global_active_power), type="l",
     ylab="Global Active Power", xlab="", cex=0.2)

## plot for voltage v/s data time
plot(dateTime, as.numeric(hpcDataSubset$Voltage), type="l",
     ylab="Voltage", xlab="datetime")

## plot for Energy sub metering 
plot(dateTime, as.numeric(hpcDataSubset$Sub_metering_1), type="l",
     ylab="Energy Sub metering", xlab="")

lines(dateTime, as.numeric(hpcDataSubset$Sub_metering_2), type="l", col="red")
lines(dateTime, as.numeric(hpcDataSubset$Sub_metering_3), type="l", col="blue")
## legend refering to these plots upper right
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"), bty = "n")

plot(dateTime, as.numeric(hpcDataSubset$Global_reactive_power), type="l", xlab="datetime",
     ylab="Global_reactive_power")
dev.off()

