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

png(file = "plot1.png")
    ## open png device and create a file called "plot1.png" in working directory

with(powerConsumption, hist(as.numeric(Global_active_power),
                            col = "red",
                            main = "Global Active Power",
                            xlab = "Global Active Power (kilowatts)"))
    ## create a histogram of Global_active_power variable in powerConsumption
    ## dataset

dev.off()
    ## close the png device