This Github repository contains four R scripts, each of which produce a plot in the form of a png file. Examples of these png files are also included in this repository.

## Requirements for running the R scripts 
In order to run the script, you will need to download the following dataset, and unzip it to your working directory, without renaming it: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

You will also need the data.table R package installed in order to run the scripts.

Note that the scripts each read the the whole large dataset into R, so may take some time to create the png files. It may also spit out warning messages, but these can be ignored. 

Once each script is run, a png file will appear in your working directory read for viewing. For example, plot1.R will produce plot1.png.

## What each plot shows

### plot1.png
A histogram of Global_active_power (in kilowatts) used by a household over a 2-day period in February, 2007.

### plot2.png
A line chart showing how Global_active_power (in kilowatts) used by a household varies over a 2-day period in February, 2007.

### plot3.png
A line chart showing energy consumption (in watt-hour of active energy) at 3 sub_metering points in a household over a 2-day period in February, 2007:

* Sub_metering_1 corresponds to the kitchen  
* Sub_metering_2 corresponds to the laundry room  
* Sub_metering_3 corresponds to an electric water-heater and an air-conditioner   

### plot4.png
4 plots showing various measurements of electric power consumption in one household over a 2-day period in Feb, 2007, as follows:

* Topleft plot: As per plot2.png above  
* Topright plot: Minute-averaged voltage (in volt)  
* Bottomleft plot: As per plot3.png above  
* Bottomright plot: Household global minute-averaged reactive power (in kilowatt)