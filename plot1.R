## reading data
totelec <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
febpower <- subset(totelec, as.Date(Date, format="%d/%m/%Y")==as.Date("2/2/2007", format="%d/%m/%Y")
                   | as.Date(Date, format="%d/%m/%Y")==as.Date("1/2/2007", format="%d/%m/%Y"))
## this is not the most efficient way memorywise but I have been struggling to use the grep 
## and readLines functions to avoid doing that

## plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(febpower$Global_active_power)), col="red", main="Global Active Power", xlab="Global active power (kilowatts)")
#dev.copy(png, file="Plot1.png")
dev.off()
