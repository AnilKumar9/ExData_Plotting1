
dir.create("data_ploting")

setwd("data_ploting")

#Downlaoding dataset from web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "zipped_file")


#Unzipping the data set
zipped_file<-unzip("zipped_file",exdir="unzipped_data")

#Changing directory to read unzipped data
setwd("unzipped_data")

##reading data
data_set<-read.table("household_power_consumption.txt", header = TRUE,sep = ";",stringsAsFactors=FALSE)

##Subseting data for 2 days only
data_subset<-subset(data_set,(as.Date(data_set$Date,"%d/%m/%Y")=="2007-02-02"
                              |as.Date(data_set$Date,"%d/%m/%Y")=="2007-02-01"))

png('plot1.png')
hist(as.numeric(data_subset$Global_active_power),col="red",main ="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

