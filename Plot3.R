## reading data
totelec <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
febpower <- subset(totelec, as.Date(Date, format="%d/%m/%Y")==as.Date("2/2/2007", format="%d/%m/%Y")  | as.Date(Date, format="%d/%m/%Y")==as.Date("1/2/2007", format="%d/%m/%Y"))
## this is not the most efficient way memorywise but I have been struggling to use the grep 
## and readLines functions to avoid doing that

## plot3
x <- strptime(paste(as.Date(febpower$Date, format="%d/%m/%Y"), febpower$Time), format="%Y-%m-%d %T")
## x represents time in minutes accross 2 days: 1/2/2007 and 2/2/2007

png("Plot3.png", width=480, height=480)
#prints directly in newly created png file
par(ps=10)
plot(x, as.numeric(as.character(febpower$Sub_metering_1)), type="l", xlab="", ylab="Energy Sub Metering", col="black")
lines(x, as.numeric(as.character(febpower$Sub_metering_2)), col="red", ps=11)
lines(x, as.numeric(as.character(febpower$Sub_metering_3)), col="blue")
legend("topright", lty=c(1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex=1, cex=.8)
#dev.copy(png, file="Plot3.png")
dev.off()