filedata<-read.table(file="household_power_consumption.txt",header=TRUE,
                     sep=";", na.strings = "?",stringsAsFactors = FALSE)
filedata[,1]<-as.Date(filedata[,1], format="%d/%m/%Y")
filedata1<-filedata[(filedata[,1]>="2007-02-01" & filedata[,1]<="2007-02-02"),]
filedata1[,3]=as.numeric(filedata1[,3])
png(filename="plot2.png",width=480,height=480)
plot(strptime(paste(filedata1[,1],filedata1[,2]),"%Y-%m-%d %H:%M:%S"),
     (filedata1[,3]),
     type="l",xlab="Days",ylab="Global Active Power(Kilowatts)",
     main="Global Active Power")
dev.off() 
