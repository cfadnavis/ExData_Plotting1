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

# Print PNG. Default settings for width and height match assignment specs.
# TODO: Remove the "Index" label from the plot
png("plot3.png")
plot(subd$Sub_metering_1,type=n)
plot(subd$Sub_metering_1,type="l",col="black",lty="solid",xlab=NULL,ylab="Energy sub metering",xaxt="n")
lines(subd$Sub_metering_2,type="l",col="red",lty="solid",xlab=NULL,ylab="Energy sub metering",xaxt="n")
lines(subd$Sub_metering_3,type="l",col="blue",lty="solid",xlab=NULL,ylab="Energy sub metering",xaxt="n")
l <- length(subd$Global_active_power)
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,l/2,l))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty="solid")
dev.off()