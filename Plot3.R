## Store dataset to variable
infile <- "Rawdata/household_power_consumption.txt"

## Read dataset pointed to be infile, ste header to true and 
## change all occurrances of ? to NA.
## Finally subset dataset grabbing only data for 1/2/2007 & 2/2/2007
hpc <- read.csv(infile, header = TRUE, sep = ";", na.strings = "?")
hpc <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))



## Copy plot to png file
png(file = "Plot3.png")
## Set up empty chart displaying sub_metering_1 as Black line chartset and set the y-axis label
with(hpc, plot(Sub_metering_1, type = "l",xaxt = "n" ,xlab = "", ylab = "Energy sub metering"))
## Display sub_metering_2 as Red line chart
lines(hpc$Sub_metering_2, type = "l",xaxt = "n", col = "red")
## Display sub_metering_2 as Blue line chart
lines(hpc$Sub_metering_3, type = "l",xaxt = "n", col = "blue")

## Set the x-axis tick marks as days of week
axis(1, at = c("1","1440","2880"), labels = c("Thur", "Fri", "Sat"))
## Set up chart legend
legend("topright",lty=1, lwd=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()