setwd("C:/Users/FM/Documents/Personal/Data_Science_Coursera/Course-4/ExData_Plotting1-master")
file<-read.table(file = "household_power_consumption.txt",sep = ";")
names(file)<-as.matrix(file[1,])
file<-file[-1,]
file[]<-lapply(file,function(x) type.convert(as.character(x)))


subset1<-subset(file, file$Date=="1/2/2007"|file$Date=="2/2/2007")

datetime<-as.POSIXct(paste(as.Date(subset1$Date, "%d/%m/%Y"), subset1$Time))

par(mfrow=c(2,2))


#plot1 of matrix
plot(as.POSIXct(paste(as.Date(subset1$Date, "%d/%m/%Y"), subset1$Time)), as.numeric(subset1$Global_active_power)/1000, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")


#plot2 of matrix
plot(as.POSIXct(paste(as.Date(subset1$Date, "%d/%m/%Y"), subset1$Time)), as.numeric(subset1$Voltage), type = "l", xlab = "", ylab = "Voltage")

#plot3 of matrix
plot(datetime, as.numeric(subset1$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Sub Metering", col="black")

lines(datetime, as.numeric(subset1$Sub_metering_2), type = "l", xlab = "", ylab = "Energy Sub Metering", col="red")

lines(datetime, as.numeric(subset1$Sub_metering_3), type = "l", xlab = "", ylab = "Energy Sub Metering", col="blue")

legend("topleft", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black","red","blue"), lty = 1:2, cex=0.8)


#plot4 of matrix

plot(as.POSIXct(paste(as.Date(subset1$Date, "%d/%m/%Y"), subset1$Time)), as.numeric(subset1$Global_reactive_power)/1000, type = "l", xlab = "", ylab = "Global Reactive Power(kilowatts)")




dev.copy(png,'plot4.png')
dev.off()