# exploratory data analysis, week 1, programming assignment 1

elec_fname<-"household_power_consumption.txt"

mem_needed <- 2075259 * 9 *8 

# read data
edata <- read.table(elec_fname, header=TRUE, stringsAsFactors=FALSE, sep=";",na.strings=c("?",""))

# conversions and subsetting

posixdates <- as.POSIXct(strptime(paste(edata$Date, edata$Time),"%d/%m/%Y %H:%M:%S"),tz = "GMT")
mindate <- as.POSIXlt(strptime("01/02/2007 0:0:0","%d/%m/%Y %H:%M:%S"))
maxdate <- as.POSIXlt(strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S"))
ii <- (posixdates >= mindate & posixdates <= maxdate)
sel_edata <- edata[ii,]

## plotting ##

png(filename="plot4.png",units="px", width=480, height=480, res=72)

par(mfrow=c(2,2))

plot(posixdates[ii],sel_edata$Global_active_power,type="l",col="black",ylab="Global Active Power (kilowatts)",xlab="")

plot(posixdates[ii],sel_edata$Voltage,type="l",col="black",ylab="Voltage",xlab="datetime")

plot(posixdates[ii],sel_edata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(posixdates[ii],sel_edata$Sub_metering_2,type="l",col="red")
lines(posixdates[ii],sel_edata$Sub_metering_3,type="l",col="blue")
legend('topright', names(sel_edata)[7:9] , lty=1, col=c('black', 'red', 'blue',' brown'), cex=.75)

plot(posixdates[ii],sel_edata$Global_reactive_power,type="l",col="black",ylab="Global_reactive_power",xlab="datetime")

dev.off()