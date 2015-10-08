#reading data from file household_power_consumption.txt
file <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# making a vector with period of interest
period <- c("1/2/2007","2/2/2007")
#getting all data about period of interest
data <- file[file$Date %in% period,]
#getting data only about global active power
globalActivePower <- as.numeric(data$Global_active_power)
#making png graphics device
png("plot1.png", width=480, height=480)
#drawing histogram according to task
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#shut down device
dev.off()