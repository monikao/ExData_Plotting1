exData <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na = "?")

exData$Time <- strptime(paste(exData$Date, exData$Time), "%d/%m/%Y %H:%M:%S")
exData$Date <- as.Date(exData$Date, "%d/%m/%Y")
# only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
exData <- subset(exData, Date %in% dates)


library(datasets)
png("plot3.png", width=480, height=480)

plot(exData$Time, exData$Sub_metering_1,  type="n", xlab = "", ylab= "Energy sub metering")
points(exData$Time, exData$Sub_metering_1,  type="l", xlab = "", ylab= "Energy sub metering", col="black")
points(exData$Time, exData$Sub_metering_2,  type="l", xlab = "", ylab= "Energy sub metering", col="red")
points(exData$Time, exData$Sub_metering_3,  type="l", xlab = "", ylab= "Energy sub metering", col="blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()