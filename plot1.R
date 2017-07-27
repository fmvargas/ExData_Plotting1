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


#plot 1
hist(data.interest$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
