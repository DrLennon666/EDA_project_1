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

# Convert global active power from factor to numeric.
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)

png('plot2.png')
plot(data$DateTime,data$Global_active_power,type='l',xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



# This new YOB record is pretty good.

