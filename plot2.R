exData <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na = "?")

exData$Time <- strptime(paste(exData$Date, exData$Time), "%d/%m/%Y %H:%M:%S")
exData$Date <- as.Date(exData$Date, "%d/%m/%Y")
# only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
exData <- subset(exData, Date %in% dates)


library(datasets)
png("plot2.png", width=480, height=480)

plot(exData$Time, exData$Global_active_power,  type="l", xlab = "", ylab= "Global Active Power (kilowatts)")

dev.off()