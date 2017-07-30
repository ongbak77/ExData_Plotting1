## reading data
totelec <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
febpower <- subset(totelec, as.Date(Date, format="%d/%m/%Y")==as.Date("2/2/2007", format="%d/%m/%Y")  | as.Date(Date, format="%d/%m/%Y")==as.Date("1/2/2007", format="%d/%m/%Y"))
## this is not the most efficient way memorywise but I have been struggling to use the grep 
## and readLines functions to avoid doing that


## plot2
x <- strptime(paste(as.Date(febpower$Date, format="%d/%m/%Y"), febpower$Time), format="%Y-%m-%d %T")
## x represents time in minutes accross 2 days: 1/2/2007 and 2/2/2007
png("Plot2.png", width=480, height=480)
plot(x, as.numeric(as.character(febpower$Global_active_power)), type="l", xlab="", ylab="Global active power (kilowatts)")
#dev.copy(png, file="Plot2.png")
dev.off()