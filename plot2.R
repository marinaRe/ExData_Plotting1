#read file
household.df <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings = "?")
subSetData <- household.df[household.df$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

#plot2
png(file = "plot2.png") ## Open PNG device; create 'plot2.png' in my working directory

  plot(subSetData$datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

dev.off() ## Close the png file device

