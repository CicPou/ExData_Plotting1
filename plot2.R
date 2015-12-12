## See README2.md for information on how to run the R script below, and what it
## produces

library(data.table)
## load data.table package (required for fread)

powerConsumption <- fread("household_power_consumption.txt", na.strings = "?",
                          data.table = FALSE)
## read the file

powerConsumption <- subset(powerConsumption,
                           Date == "1/2/2007" | Date == "2/2/2007")
## select only the rows where Date is 1/2/2007 or 2/2/2007

powerConsumption$datetime <- paste(powerConsumption$Date,
                                   powerConsumption$Time,
                                   sep = " ")
## add a new variable called datetime that is the combined Date and Time

powerConsumption$datetime <- strptime(powerConsumption$datetime,
                                      "%d/%m/%Y %H:%M:%S")
## convert datetime to POSIXlt format

png(file = "plot2.png")
## open png device and create a file called "plot2.png" in working directory

with(powerConsumption, plot(datetime, Global_active_power,
                            type = "n",
                            xlab = "",
                            ylab = "Global Active Power (kilowatts)"))
## create an empty plot of datetime on x axis and Global_active_power on y axis

lines(powerConsumption$datetime, powerConsumption$Global_active_power)
## plot a line showing Global_active_power over time

dev.off()
## close the png device