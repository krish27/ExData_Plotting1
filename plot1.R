## Plot1

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

## prepare a file plot1.png in current directory
png("plot1.png", bg = "white",width = 480, height = 480)

## prepare a Vector of values for which histogram is desired.
histVector <- as.numeric(hpcDataSubset$Global_active_power)

## prepare a histogram for given values
hist(histVector, col="red", plot = TRUE,
     main = "Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

  

