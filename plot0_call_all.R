######
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#  
#  Date: Date in format dd/mm/yyyy </br>
#  Time: time in format hh:mm:ss </br>
#  Global_active_power: household global minute-averaged active power (in kilowatt) </br>
#  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)  </br>
#  Voltage: minute-averaged voltage (in volt) </br>
#  Global_intensity: household global minute-averaged current intensity (in ampere)  </br>
#  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </br>
#  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </br>
#  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner. 
#
#Requirements
#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
#
#First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
#
#For each plot you should
#
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Name each of the plot files as plot1.png, plot2.png, etc.</br>
#Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
#Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)</br>
#When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.</br>
#
# 
######
###### Author: Keith Bailey
###### Date: 2016-07-13



#Download dataset
#if(!file.exists("./data")){dir.create("./data")}
fileURL1<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL1, destfile="./power_data.zip",method="curl")
unzip("./power_data.zip", exdir=".")

powerdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", quote="\"", na.strings = "?")
powerdata<-cbind(powerdata,as.POSIXlt(strptime(paste(powerdata$Date,powerdata$Time),format="%d/%m/%Y %H:%M:%S")))
powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")
colnames(powerdata)[10]<-"DateTime"

#Get subset of data for 2007-02-01 to 2007-02-02
powerdata.feb <- subset(powerdata, Date>="2007-02-01" & Date<="2007-02-02")


#return 
par(mfcol=c(1,1))
