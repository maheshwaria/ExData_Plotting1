filedata<-read.table(file="household_power_consumption.txt",header=TRUE,
                     sep=";", na.strings = "?",stringsAsFactors = FALSE)
filedata[,1]<-as.Date(filedata[,1], format="%d/%m/%Y")
filedata1<-filedata[(filedata[,1]>="2007-02-01" & filedata[,1]<="2007-02-02"),]
filedata1[,3]=as.numeric(filedata1[,3])
png(filename="plot1.png",width=480,height=480)
hist(filedata1[,3],col="red",xlab="Global Active Power(Kilowatts)",
     main="Global Active Power")
dev.off() 