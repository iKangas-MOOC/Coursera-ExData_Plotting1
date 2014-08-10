#read table
data1 <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#subset according to date
data1$Date<-as.Date(data1$Date,"%d/%m/%Y")
dat1<-subset(data1,data1$Date=="2007-02-01"|data1$Date=="2007-02-02")
#to char
dat1$Date <- as.character(dat1$Date)
dat1$Time <- as.character(dat1$Time)
dat1$Date<-paste(dat1$Date,dat1$Time, sep = " ", collapse = NULL)
dat1$Date <- strptime(dat1$Date, "%Y-%m-%d %H:%M:%S")
#plot
par(mfrow=c(2,2))
#1
plot(dat1$Date,dat1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#2
plot(dat1$Date,dat1$Voltage,type="l",ylab="Voltage",xlab="datetime")
#3
plot(dat1$Date,dat1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dat1$Date,dat1$Sub_metering_2,type="l",col="red")
lines(dat1$Date,dat1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=1,cex=c(0.3,0.3,0.3))
#4
plot(dat1$Date,dat1$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#save to png
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()