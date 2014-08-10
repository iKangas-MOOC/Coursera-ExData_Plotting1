#read table
data1 <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#subset according to date
data1$Date<-as.Date(data1$Date,"%d/%m/%Y")
dat1<-subset(data1,data1$Date=="2007-02-01"|data1$Date=="2007-02-02")
#plot
hist(dat1$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
#save to png
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()