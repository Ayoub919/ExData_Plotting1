#coursera project1 exploratory data analysis
#Our overall goal here is simply to examine how household energy usage varies
#over a 2-day periodin February, 2007. 
#Plot of energy sub metering and legend

setwd("~/Ayoub/COURSERA/UCI HAR Dataset - household")
## reading all the data 
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")
## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Converting X and Y for hist
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## creating the plot 3
with(data, {plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')})
legend("topright", col=c("black", "red", "blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png")
dev.off()
