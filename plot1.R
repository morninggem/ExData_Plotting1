##read in data, the file contains only data for dates 2007/2/1 and 2007/2/2
data <- read.table("household_power_consumption_subset.txt",header=TRUE,sep=";")

##open png device, create "plot1.png" in working directory
png(filename="plot1.png",
    width=480, height=480, units="px") 

##produce plot
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
     
##close the png device
dev.off() 



