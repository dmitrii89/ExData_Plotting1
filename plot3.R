# reading data from file household_power_consumption.txt
file <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# making a vector with period of interest
period <- c("1/2/2007","2/2/2007")
# getting all data about period of interest
data <- file[file$Date %in% period,]
# getting all data about submeterings separately
submet1 <- as.numeric(data$Sub_metering_1)
submet2 <- as.numeric(data$Sub_metering_2)
submet3 <- as.numeric(data$Sub_metering_3)
# connecting date and time fields
datetime <- paste(data$Date, data$Time, sep = " ")
# making date and time according to format
formdate <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
# making png graphics device
png("plot3.png", width=480, height=480)
# transparent background according to example unnamed-chunk-4.png
par('bg' = 'transparent')
# drawing plot according to task
plot(formdate, submet1, type = "l" , col="black", xlab ='', ylab="Energy sub metering")
lines(formdate, submet2, type = "l", col="red" )
lines(formdate, submet3, type = "l", col="blue" )
# making necessary legend
pcolumns <- c("black", "red", "blue")
plegend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col = pcolumns, legend = plegend, lty=1)
# shut down device
dev.off()