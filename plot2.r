#Download dataset
#if(!file.exists("./data")){dir.create("./data")}
fileURL1<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL1, destfile="./power_data.zip",method="curl")
unzip("./power_data.zip", exdir=".")

#read in the dataset
powerdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", quote="\"", na.strings = "?")

#Add a new column containing a datetime field
powerdata<-cbind(powerdata,as.POSIXlt(strptime(paste(powerdata$Date,powerdata$Time),format="%d/%m/%Y %H:%M:%S")))
colnames(powerdata)[10]<-"DateTime"

#Convert Date field to date type
powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")

#Get subset of data for 2007-02-01 to 2007-02-02
powerdata.feb <- subset(powerdata, Date>="2007-02-01" & Date<="2007-02-02")

#create plot2
png(file="plot2.png", width=480, height=480) #Open a PDF device we can plot to
with(powerdata.feb, plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off() #close the PDF file device