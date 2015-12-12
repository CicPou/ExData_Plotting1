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

png(file = "plot4.png")
## open png device and create a file called "plot4.png" in working directory

par(mfrow = c(2,2))
## allow multiple plots over 2 rows and 2 columns, populating rows first

with(powerConsumption, {
    plot(datetime, Global_active_power, ## create topleft plot
         type = "n",
         xlab = "",
         ylab = "Global Active Power")
    lines(datetime, Global_active_power)

    plot(datetime, Voltage, type = "n") ## create topright plot
    lines(datetime, Voltage)

    plot(datetime, Sub_metering_1, ## create bottomleft plot
         type = "n",
         xlab = "",
         ylab = "Energy sub metering")
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright",
           lty = "solid",
           col = c("black", "red", "blue"),
           legend = names(powerConsumption[7:9]))

    plot(datetime, Global_reactive_power, type = "n") ## create bottomright plot
    lines(datetime, Global_reactive_power)
})

dev.off()
## close the png device