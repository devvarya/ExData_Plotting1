#Load the text file

df <- "./household_power_consumption.txt"

#Read the text file

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data appropriately

subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Coerce to numeric 

globalActivePower <- as.numeric(subdata$Global_active_power)

#Launch the graphics device(file device:PNG)

png("plot1.png", width=480, height=480)

#Create(and annotate) the plot

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the graphics device

dev.off()