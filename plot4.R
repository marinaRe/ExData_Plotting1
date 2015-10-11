#read file
household.df <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings = "?")
subSetData <- household.df[household.df$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot4

png(file = "plot4.png") ## Open PNG device; create 'plot4.png' in my working directory

  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

      plot(subSetData$datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

      plot(subSetData$datetime, subSetData$Voltage, type="l",xlab="datetime", ylab= "Voltage")

      plot(subSetData$datetime,subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
      lines(subSetData$datetime,subSetData$Sub_metering_2, col = "red")
      lines(subSetData$datetime,subSetData$Sub_metering_3, col = "blue")
      legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")

      plot(subSetData$datetime, subSetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off() ## Close the png file device