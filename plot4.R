# Read data
# TODO: Figure out how to specify colClasses to read in data appropriately 
# TODO: Figure out how to extract only a subset of records based on date criteria
d <- read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

# Convert Date to strptime to filter data for relevant dates
d$Date <- strptime(d$Date,"%d/%m/%Y")

# Create date objects for relevant dates
d1 <- strptime("2007-02-01","%Y-%m-%d")
d2 <- strptime("2007-02-02","%Y-%m-%d")

# Extract subset of data for matching dates
subd <- subset(d,Date==d1|Date==d2)

# Convert Global_active_power from factor to numeric
subd$Global_active_power <- as.numeric(subd$Global_active_power)

# Print PNG. Default settings for width and height match assignment specs.
png("plot4.png")
par(mfrow=c(2,2))
# plot 1,1
plot(subd$Global_active_power,type="l",lty="solid",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
l <- length(subd$Global_active_power)
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,l/2,l))
# plot 1,2
plot(subd$Voltage,type="l",lty="solid",xlab="datetime",ylab="Voltage",xaxt="n")
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,l/2,l))
# plot 2,1
plot(subd$Sub_metering_1,type="l",col="black",lty="solid",xlab="",ylab="Energy sub metering",xaxt="n")
lines(subd$Sub_metering_2,type="l",col="red",lty="solid",xlab="",ylab="Energy sub metering",xaxt="n")
lines(subd$Sub_metering_3,type="l",col="blue",lty="solid",xlab="",ylab="Energy sub metering",xaxt="n")
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,l/2,l))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty="solid")
# plot 2,2
plot(subd$Global_reactive_power,type="l",lty="solid",xlab="",ylab="Global Reactive Power (kilowatts)",xaxt="n")
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,l/2,l))
dev.off()