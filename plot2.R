## Plot2

## Refer README.md for instructions to download dataset.

## File household_power_consumption.txt containg data should
## be in your current working directory or you can
## specify the file path.

hpcFile = "household_power_consumption.txt"

## validation to check whether household_power_consumption.txt file exits

if(!file.exists(hpcFile))
{
  message("the household_power_consumption file does not exists")
}
hpcData <- read.table(hpcFile, header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)

hpcDataSubset <- hpcData[hpcData$Date %in% c("1/2/2007","2/2/2007") ,]

date <- as.character(as.Date(hpcDataSubset$Date, "%d/%m/%Y"))
m <- paste(date, hpcDataSubset$Time)
dateTime <- strptime(m, "%Y-%m-%d %H:%M:%S")

## prepare a file plot2.png in current directory.
png("plot2.png", bg = "white", width = 480, height = 480)

plot(dateTime, as.numeric(hpcDataSubset$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

