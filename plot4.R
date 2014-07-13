##read in data, the file contains only data for dates 2007/2/1 and 2007/2/2
data <- read.table("household_power_consumption_subset.txt",header=TRUE,sep=";")
data$dt <- paste(data$Date, data$Time, sep=' ')
data$datetime <- strptime(data$dt, format='%d/%m/%Y %H:%M:%S')

##open png device, create "plot4.png" in working directory
png(filename="plot4.png",
    width=480, height=480, units="px") 

##produce plots
par(mfcol=c(2,2))
with(data, {
     ##plot1
     plot(data$datetime, data$Global_active_power,type="n",
          xlab="", ylab="Global Active Power")
     lines(data$datetime, data$Global_active_power,type="l")           
     ##Plot2
     plot(data$datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
     lines(data$datetime, data$Sub_metering_1,col="black")
     lines(data$datetime, data$Sub_metering_2, col="red")
     lines(data$datetime, data$Sub_metering_3, col="blue")
     legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            col=c("black","red","blue"),lty=c(1,1,1),pt.cex=1,cex=1,bty="n")
     ##plot3
     plot(data$datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
     ##plot4
     plot(data$datetime, data$Global_reactive_power,type="l",
          xlab="datetime", ylab="Global_ractive_power")  
})
     
##close the png device
dev.off() 
