## Store dataset to variable
infile <- "Rawdata/household_power_consumption.txt"

## Read dataset pointed to be infile, ste header to true and 
## change all occurrances of ? to NA.
## Finally subset dataset grabbing only data for 1/2/2007 & 2/2/2007
hpc <- read.csv(infile, header = TRUE, sep = ";", na.strings = "?")
hpc <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))

## Display histogram setting bin colour to red. Also set main title and x-axis label
with(hpc, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

## Copy plot to png file
dev.copy(png, file = "Plot1.png")
dev.off()
