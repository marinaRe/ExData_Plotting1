#read file
household.df <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings = "?")
subSetData <- household.df[household.df$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot3

png(file = "plot3.png") ## Open PNG device; create 'plot3.png' in my working directory

  plot(subSetData$datetime,subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
  lines(subSetData$datetime,subSetData$Sub_metering_2, col = "red")
  lines(subSetData$datetime,subSetData$Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off() ## Close the png file device