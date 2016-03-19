## Store dataset to variable
infile <- "Rawdata/household_power_consumption.txt"

## Read dataset pointed to be infile, ste header to true and 
## change all occurrances of ? to NA.
## Finally subset dataset grabbing only data for 1/2/2007 & 2/2/2007
hpc <- read.csv(infile, header = TRUE, sep = ";", na.strings = "?")
hpc <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))


par(mfrow = c(2, 2), mar=c(3.1,4.1,3.1,2.1))
with(hpc, plot(Global_active_power, type = "l", xaxt = "n" ,xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(1, at = c("1","1440","2880"), labels = c("Thur", "Fri", "Sat"))

with(hpc, plot(Voltage, type = "l", xaxt = "n" ,xlab = "DateTime", ylab = "Voltage"))
axis(1, at = c("1","1440","2880"), labels = c("Thur", "Fri", "Sat"))

with(hpc, plot(Sub_metering_1, type = "l",xaxt = "n" ,xlab = "", ylab = "Energy sub metering"))
lines(hpc$Sub_metering_2, type = "l",xaxt = "n", col = "red")
lines(hpc$Sub_metering_3, type = "l",xaxt = "n", col = "blue")
axis(1, at = c("1","1440","2880"), labels = c("Thur", "Fri", "Sat"))
legend("topright",bty="n", lty=1, lwd=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(hpc, plot(Global_reactive_power, type = "l", xaxt = "n" ,xlab = "DateTime"))
axis(1, at = c("1","1440","2880"), labels = c("Thur", "Fri", "Sat"))

## Copy plot to png file
dev.copy(png, file = "Plot4.png")
dev.off()