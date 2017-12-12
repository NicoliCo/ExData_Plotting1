# read header
header = read.table("household_power_consumption.txt", na.strings = "?", sep=";",
                    nrows=1,colClasses = rep("character",9))
# read data
householdPower = read.table("household_power_consumption.txt", na.strings = "?",
                     skip=66637,nrows=2880,sep=";",col.names = as.vector(header))

# combine date and time into one date/time variable
# and remove old date and time variables
date = paste(householdPower$Date,householdPower$Time,sep=" ")
dateTime = strptime(date,"%d/%m/%Y %H:%M:%S")
householdPower$DateTime = dateTime
householdPower = householdPower[,c(10,3:9)]


# create plot
plot(householdPower$DateTime,householdPower$Global_active_power,type="n",
     xlab="",ylab="Global Active Power (kilowatts)")
lines(householdPower$DateTime,householdPower$Global_active_power)

dev.copy(png,file="plot2.png")
dev.off()
