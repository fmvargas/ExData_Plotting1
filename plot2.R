# Load and prepare data

# Load the data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?" )
unlink(temp)

# Get the data of interest
data.interest <- data[grep("^1/2/2007$|^2/2/2007$", data$Date),]
rm(data)

# Format Date and Time as Time
data.interest$Date <- strptime(paste(data.interest$Date,data.interest$Time), "%d/%m/%Y %H:%M:%S")


#plot2
plot(data.interest$Date,data.interest$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
