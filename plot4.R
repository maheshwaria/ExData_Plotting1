filedata<-read.table(file="household_power_consumption.txt",header=TRUE,
                     sep=";", na.strings = "?",stringsAsFactors = FALSE)
filedata[,1]<-as.Date(filedata[,1], format="%d/%m/%Y")
filedata1<-filedata[(filedata[,1]>="2007-02-01" & filedata[,1]<="2007-02-02"),]
filedata1[,3]=as.numeric(filedata1[,3])
png(filename="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
     (filedata1[,3]),
     type="l",xlab="",ylab="Global Active Power(Kilowatts)")

plot(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
     (filedata1[,5]),
     type="l",xlab="datetime",ylab="Voltage")

plot(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
     (filedata1[,7]),
     type="n",xlab="",ylab="Energy sub metering",
     yaxp=c(0,40,4))
points(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
       filedata1[,7],col="black",type="l")
points(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
       filedata1[,8],col="red",type="l")
points(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
       filedata1[,9],col="blue",type="l")
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
     (filedata1[,4]),
     type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off() 