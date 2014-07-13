##read in data, the file contains only data for dates 2007/2/1 and 2007/2/2
data <- read.table("household_power_consumption_subset.txt",header=TRUE,sep=";")
data$dt <- paste(data$Date, data$Time, sep=' ')
data$datetime <- strptime(data$dt, format='%d/%m/%Y %H:%M:%S')

##open png device, create "plot2.png" in working directory
png(filename="plot2.png",
    width=480, height=480, units="px") 

##produce plot
plot(data$datetime, data$Global_active_power,type="n",
     xlab="", ylab="Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power,type="l")

##close the png device
dev.off() 
