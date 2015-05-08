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

#Create the plot which I have manually saved after
plot(data$calendardate, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")