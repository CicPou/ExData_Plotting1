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

png(file = "plot3.png")
## open png device and create a file called "plot3.png" in working directory

with(powerConsumption, plot(datetime, Sub_metering_1,
                            type = "n",
                            xlab = "",
                            ylab = "Energy sub metering"))
## create an empty plot of datetime on x axis and Sub_metering_1 on y axis

lines(powerConsumption$datetime, powerConsumption$Sub_metering_1)
lines(powerConsumption$datetime, powerConsumption$Sub_metering_2, col = "red")
lines(powerConsumption$datetime, powerConsumption$Sub_metering_3, col = "blue")
## plot 3 lines in different colours showing Sub_metering_1, 2 and 3 over time

legend("topright",
       lty = "solid",
       col = c("black", "red", "blue"),
       legend = names(powerConsumption[7:9]))
## add a legend in the top right of the plot

dev.off()
## close the png device