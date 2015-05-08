#Requires this library for read.csv2.sql
library(sqldf)

## If the data variable hasn't been created yet
## create and picky select the rows needed
if (!exists("data")) {
    sql <- "SELECT * from file WHERE DATE = '1/2/2007' OR DATE = '2/2/2007'"
    data <- read.csv2.sql('./data//household_power_consumption.txt', sql, sep = ";", header = TRUE)
}

#Create the plot which I have manually saved after
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main= "Global Active Power")