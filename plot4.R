#Requires this library for read.csv2.sql
library(sqldf)

## If the data variable hasn't been created yet
## create and picky select the rows needed
if (!exists("data")) {
    sql <- "SELECT * from file WHERE DATE = '1/2/2007' OR DATE = '2/2/2007'"
    data <- read.csv2.sql('./data//household_power_consumption.txt', sql, sep = ";", header = TRUE)
}

#Format the Date and Time to the calendar date
data$dateraw <- paste(data$Date, data$Time)
data$calendardate<-strptime(data$dateraw,format="%d/%m/%Y %H:%M:%S")


## Define 2 by 2 matrix to place all 4 graphs on
par(mfrow = c(2,2))

## GRAPH 1
plot(data$calendardate, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

## GRAPH 2
plot(data$calendardate, data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

##GRAPH 3
plot(data$calendardate, data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data$calendardate, data$Sub_metering_2, col="red")
lines(data$calendardate, data$Sub_metering_3, col="blue")
legend("topright", lty=1, cex=0.65, bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## GRAPH 4
plot(data$calendardate, data$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")