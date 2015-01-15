hpdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=rep("character",9))
hpdata$Datetime <- paste(hpdata$Date," ",hpdata$Time)
hpdata$Date <- as.Date(hpdata$Date,"%d/%m/%Y")
hpdatasub <- subset(hpdata,Date>="2007-02-01" & Date <="2007-02-02")
for (i in 3:9) {
hpdatasub[,i] <- as.numeric(hpdatasub[,i])
} 
hpdatasub$Datetime <- strptime(hpdatasub$Datetime,"%d/%m/%Y %H:%M:%S")
png(file="Plot2.png")
plot(hpdatasub$Datetime,hpdatasub$Global_active_power,cex=0.6,xlab="",ylab="Global active power (kilowatts)")
lines(hpdatasub$Datetime,hpdatasub$Global_active_power,cex=0.6)
dev.off()
