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
hist(householdPower$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power", ylim=c(0,1200))

dev.copy(png,file="plot1.png")
dev.off()
