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
plot(dat1$Date,dat1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#save to png
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()