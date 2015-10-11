#read file
household.df <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings = "?")
subSetData <- household.df[household.df$Date %in% c("1/2/2007","2/2/2007") ,]

#plot1
png(file = "plot1.png") ## Open PNG device; create 'plot1.png' in my working directory

  hist(subSetData$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() ## Close the png file device
