# exploratory data analysis, week 1, programming assignment 1

elec_fname<-"household_power_consumption.txt"

mem_needed <- 2075259 * 9 *8 

# reading file
edata <- read.table(elec_fname, header=TRUE, stringsAsFactors=FALSE, sep=";",na.strings=c("?",""))

# date conversion and subsetting
posixdates <- as.POSIXct(strptime(paste(edata$Date, edata$Time),"%d/%m/%Y %H:%M:%S"),tz = "GMT")
mindate <- as.POSIXlt(strptime("01/02/2007 0:0:0","%d/%m/%Y %H:%M:%S"))
maxdate <- as.POSIXlt(strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S"))
ii <- (posixdates >= mindate & posixdates <= maxdate)
sel_edata <- edata[ii,]

# plot 1
png(filename="plot1.png",units="px", width=480, height=480, res=72)
hist(sel_edata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()