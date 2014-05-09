## Plot3

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

## prepare a file plot3.png in current directory
png("plot3.png", width = 480, height = 480)
## plot for sub metering 1
plot(dateTime, as.numeric(hpcDataSubset$Sub_metering_1), type="l",
     ylab="Energy Sub metering", xlab="")
## plot for sub metering 2
lines(dateTime, as.numeric(hpcDataSubset$Sub_metering_2), type="l", col="red")
## plot for sub metering 3
lines(dateTime, as.numeric(hpcDataSubset$Sub_metering_3), type="l", col="blue")
## legend refering to these plots upper right
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
        col=c("black", "red", "blue"))
dev.off()

