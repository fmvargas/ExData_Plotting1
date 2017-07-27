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


#plot4
#set layout
par(mfcol=c(2,2))

#make plot in top left
plot(data.interest$Date,data.interest$Global_active_power, type="l",ylab="Global Active Power",xlab="")

#make plot in top left, legend border not visible, legend font adjusted
plot(data.interest$Date,data.interest$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data.interest$Date,data.interest$Sub_metering_2, type="l", col="red")
lines(data.interest$Date,data.interest$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)

#make plot in top right
plot(data.interest$Date,data.interest$Voltage, type="l",ylab="Voltage",xlab="datetime")

#make plot in top right
plot(data.interest$Date,data.interest$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

#copy graphic device to file
dev.copy(png,file="plot4.png")
dev.off()

