# Exploratory data analysis project 1 - Data

datafile<-"/household_power_consumption.txt"
data<- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plot 1 - Histogram

globalactive<- as.numeric(subsetdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalactive, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()

#Plot 2 -  Plot date and time

datetime<- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalactive2<- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width = 480, height= 480)
plot(datetime, globalactive2, type= "l", xlab=" ", ylab=" Global Active Power (Kilowatts)")
dev.off()

# Plot 3 - Plot data and time 2 

datetimes<- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalactivepower<- as.numeric(subsetdata$Global_active_power)
submetering1<- as.numeric(subsetdata$Sub_metering_1)
submetering2<- as.numeric(subsetdata$Sub_metering_2)
submetering3<- as.numeric(subsetdata$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetimes, submetering1, type= "l", ylab="Energy Submetering", xlab=" ")
lines(datetimes, submetering2, type= "l", col="red")
lines(datetimes, submetering3, type= "l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()

#Plot 4 - Summary of plots
datetimes<- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalactivepower<- as.numeric(subsetdata$Global_active_power)
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
submetering1<- as.numeric(subsetdata$Sub_metering_1)
submetering2<- as.numeric(subsetdata$Sub_metering_2)
submetering3<- as.numeric(subsetdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetimes, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetimes, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetimes, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimes, submetering2, type="l", col="red")
lines(datetimes, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetimes, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

