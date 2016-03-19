## Store dataset to variable
infile <- "Rawdata/household_power_consumption.txt"

## Read dataset pointed to be infile, ste header to true and 
## change all occurrances of ? to NA.
## Finally subset dataset grabbing only data for 1/2/2007 & 2/2/2007
hpc <- read.csv(infile, header = TRUE, sep = ";", na.strings = "?")
hpc <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))

## Copy plot to png file
png(file = "Plot2.png")
## Display plot, setting chart type to line. Also set x-axis label and tick labels to days of the week
with(hpc, plot(Global_active_power, type = "l", xaxt = "n" ,xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(1, at = c("1","1440","2880"), labels = c("Thur", "Fri", "Sat"))
dev.off()