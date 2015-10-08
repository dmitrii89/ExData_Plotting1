# reading data from file household_power_consumption.txt
file <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# making a vector with period of interest
period <- c("1/2/2007","2/2/2007")
# getting all data about period of interest
data <- file[file$Date %in% period,]
# getting all data separately
globalActivePower <- as.numeric(data$Global_active_power)
voltage <- as.numeric(data$Voltage)
submet1 <- as.numeric(data$Sub_metering_1)
submet2 <- as.numeric(data$Sub_metering_2)
submet3 <- as.numeric(data$Sub_metering_3)
globalReactivePower <- as.numeric(data$Global_reactive_power)
# connecting date and time fields
datetime <- paste(data$Date, data$Time, sep = " ")
# making date and time according to format
formdate <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
# making png graphics device
png("plot4.png", width=480, height=480)
# mfrow - for several plots in one png device
# 'bg' = 'transparent' according to example unnamed-chunk-5.png
par(mfrow = c(2,2), 'bg' = 'transparent')
# drawing plots according to task
# first plot - globalActivePower data
plot(formdate, globalActivePower, type = "l", xlab ='', ylab="Global Active Power")
# second plot - voltage data
plot(formdate, voltage, type = "l", xlab ='datetime', ylab="Voltage")
# third plot - three sub meterings
plot(formdate, submet1, type = "l" , col="black", xlab ='', ylab="Energy sub metering")
lines(formdate, submet2, type = "l", col="red" )
lines(formdate, submet3, type = "l", col="blue" )
pcolumns <- c("black", "red", "blue")
plegend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col = pcolumns, legend = plegend, lty=1, bty="n")
# fourth - globalReactivePower data
plot(formdate, globalReactivePower, type = "l", xlab ='datetime', ylab="Global_reactive_power")
# shut down device
dev.off()