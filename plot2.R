setwd("C:/Users/FM/Documents/Personal/Data_Science_Coursera/Course-4/ExData_Plotting1-master")
file<-read.table(file = "household_power_consumption.txt",sep = ";")
names(file)<-as.matrix(file[1,])
file<-file[-1,]
file[]<-lapply(file,function(x) type.convert(as.character(x)))


subset1<-subset(file, file$Date=="1/2/2007"|file$Date=="2/2/2007")


plot(as.POSIXct(paste(as.Date(subset1$Date, "%d/%m/%Y"), subset1$Time)), as.numeric(subset1$Global_active_power)/1000, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.copy(png,'plot2.png')
dev.off()