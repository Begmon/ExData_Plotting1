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

## Create the plot which I have manually saved after
## First create the black sub metering line 1 and place the y-ax label
## Then create the lines for sub metering 2 and 3
## Make a legenda with the colors and names hard defined
plot(data$calendardate, data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data$calendardate, data$Sub_metering_2, col="red")
lines(data$calendardate, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))