#Load the text file

df <- "./household_power_consumption.txt"

#Read the text file

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data appropriately

subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert date and time variable 

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Coerce to numeric 

globalActivePower <- as.numeric(subdata$Global_active_power)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

#Launch the graphics device(file device:PNG)

png("plot4.png", width=480, height=480)

#Specifying global graphics parameter(here: the no. of plots per row,column)

par(mfrow = c(2, 2)) 

#Create(and annotate) the plots

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the graphics device

dev.off()