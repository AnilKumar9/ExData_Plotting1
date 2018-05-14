

setwd("data_ploting")

#Downlaoding dataset from web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "zipped_file")


#Unzipping the data set
zipped_file<-unzip("zipped_file",exdir="unzipped_data")

#Changing directory to read unzipped data
setwd("unzipped_data")


##reading data

data_set<-read.table("household_power_consumption.txt", header = TRUE,sep = ";",stringsAsFactors=FALSE)
##subseting data
data_subset<-subset(data_set,(as.Date(data_set$Date,"%d/%m/%Y")=="2007-02-02"
                              |as.Date(data_set$Date,"%d/%m/%Y")=="2007-02-01"))
##plotting data
png('plot3.png')
plot(x=seq(1,length(as.numeric(data_subset$Sub_metering_1)),1),as.numeric(data_subset$Sub_metering_1),type="l",ylim=range(as.numeric(data_subset$Sub_metering_1)),ylab = "Energy Sub metering",xlab="", xaxt = "n",col="black")
par(new=TRUE)
plot(x=seq(1,length(as.numeric(data_subset$Sub_metering_2)),1),as.numeric(data_subset$Sub_metering_2),type="l",xlab="", xaxt = "n",col="red",add=TRUE,ylim=range(as.numeric(data_subset$Sub_metering_1)),ylab = "")
par(new=TRUE)
plot(x=seq(1,length(as.numeric(data_subset$Sub_metering_3)),1),as.numeric(data_subset$Sub_metering_3),type="l",xlab="", xaxt = "n",col="blue",add=TRUE,ylim=range(as.numeric(data_subset$Sub_metering_1)),ylab = "")
axis(side=1, at=c(seq(0,length(as.numeric(data_subset$Global_active_power)),
                      length(as.numeric(data_subset$Global_active_power))/2)), labels=c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), lty=1,cex = 1)
dev.off()

