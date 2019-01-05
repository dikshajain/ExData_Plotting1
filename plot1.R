setwd("C:/Users/FM/Documents/Personal/Data_Science_Coursera/Course-4/ExData_Plotting1-master")
file<-read.table(file = "household_power_consumption.txt",sep = ";")
names(file)<-as.matrix(file[1,])
file<-file[-1,]
file[]<-lapply(file,function(x) type.convert(as.character(x)))

library(dplyr)
file1<-subset(file, file$Date=="1/2/2007"|file$Date=="2/2/2007")
hist(as.numeric(file1$Global_active_power)/1000, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
png()
dev.copy(png,'plot1.png')
dev.off()
