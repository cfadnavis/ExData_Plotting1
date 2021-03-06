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
png("plot1.png")
hist(subd$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()