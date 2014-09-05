# needs Lubridate package
# set your working directory in the R console

# Read Data to data table
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Convert dates to POSIXct using lubridate package
data$Date<-dmy(data$Date)

# subset the data to the selected dates using subset() and ymd()
data<-subset(data,data$Date==ymd("2007-02-01")|data$Date==ymd("2007-02-02"))

# create a new column called DateTime which created a POSIXct vector
# using the ymd_hms function in lubridate.  This is just a time stamp.
data$DateTime=paste(data$Date,data$Time)
data$DateTime=ymd_hms(data$DateTime)

# Convert from factor to numeric.
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3-as.numeric(as.character(data$Sub_metering_3))


png('plot3.png')
plot(data$DateTime,data$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col='red')
lines(data$DateTime,data$Sub_metering_3, col='blue')
legend("topright",col=c('black','red','blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
     
dev.off()



# This new YOB record is pretty good.

