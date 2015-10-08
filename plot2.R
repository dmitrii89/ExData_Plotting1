# reading data from file household_power_consumption.txt
file <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# making a vector with period of interest
period <- c("1/2/2007","2/2/2007")
# getting all data about period of interest
data <- file[file$Date %in% period,]
# getting data as numeric only about global active power
globalActivePower <- as.numeric(data$Global_active_power)
# connecting date and time fields
datetime <- paste(data$Date, data$Time, sep = " ")
# making date and time according to format
formdate <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
# making png graphics device
png("plot2.png", width=480, height=480)
# drawing plot according to task
plot(formdate, globalActivePower, type = "l" , xlab ='', ylab="Global Active Power (kilowatts)")
# shut down device
dev.off()