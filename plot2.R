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

#Launch the graphics device(file device:PNG)

png("plot2.png", width=480, height=480)

#Create(and annotate) the plot

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close the graphics device

dev.off()