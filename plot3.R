setwd("C:/Users/FM/Documents/Personal/Data_Science_Coursera/Course-4/ExData_Plotting1-master")
file<-read.table(file = "household_power_consumption.txt",sep = ";")
names(file)<-as.matrix(file[1,])
file<-file[-1,]
file[]<-lapply(file,function(x) type.convert(as.character(x)))


subset1<-subset(file, file$Date=="1/2/2007"|file$Date=="2/2/2007")

datetime<-as.POSIXct(paste(as.Date(subset1$Date, "%d/%m/%Y"), subset1$Time))

plot(datetime, as.numeric(subset1$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Sub Metering", col="black")

lines(datetime, as.numeric(subset1$Sub_metering_2), type = "l", xlab = "", ylab = "Energy Sub Metering", col="red")

lines(datetime, as.numeric(subset1$Sub_metering_3), type = "l", xlab = "", ylab = "Energy Sub Metering", col="blue")

legend("topleft", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black","red","blue"), lty = 1:2, cex=0.8)

dev.copy(png,'plot3.png')
dev.off()