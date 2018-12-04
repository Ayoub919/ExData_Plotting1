#coursera project1 exploratory data analysis
#Our overall goal here is simply to examine how household energy usage varies
#over a 2-day periodin February, 2007. 
#Plot1 histogramme of global active power and frequency

setwd("~/Ayoub/COURSERA/UCI HAR Dataset - household")
## reading all the data 
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Converting X and Y for hist
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## creating the histo
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## saving the file to png
dev.copy(png, file="plot1.png")
dev.off()