## reading data
totelec <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
febpower <- subset(totelec, as.Date(Date, format="%d/%m/%Y")==as.Date("2/2/2007", format="%d/%m/%Y")  | as.Date(Date, format="%d/%m/%Y")==as.Date("1/2/2007", format="%d/%m/%Y"))
## this is not the most efficient way memorywise but I have been struggling to use the grep 
## and readLines functions to avoid doing that


##plot4
png("Plot4.png", width=480, height=480)
par(ps=11)
par(mfrow=c(2,2), mar=c(4,4,1,1))
## x represents time in minutes accross 2 days: 1/2/2007 and 2/2/2007
x <- strptime(paste(as.Date(febpower$Date, format="%d/%m/%Y"), febpower$Time), format="%Y-%m-%d %T")
plot(x, as.numeric(as.character(febpower$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
plot(x, as.numeric(as.character(febpower$Voltage)), type="l", xlab="datetime", ylab="Voltage")
plot(x, as.numeric(as.character(febpower$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x, as.numeric(as.character(febpower$Sub_metering_2)), col="red", ps=11)
lines(x, as.numeric(as.character(febpower$Sub_metering_3)), col="blue")
legend("topright", inset=.01, lty=c(1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex=1, cex=0.8, box.lty=0)
plot(x, as.numeric(as.character(febpower$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
