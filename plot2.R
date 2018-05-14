
getwd()
setwd("C:/Anil/Data Sciences/Plotting/")
dir.create("data_ploting")

setwd("data_ploting")

#Downlaoding dataset from web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "zipped_file")


#Unzipping the data set
zipped_file<-unzip("zipped_file",exdir="unzipped_data")

#Changing directory to read unzipped data
setwd("unzipped_data")
data_folder<-list.files()
##reading data
data_set<-read.table(data_folder, header = TRUE,sep = ";",stringsAsFactors=FALSE)
##subsetingdata
data_subset<-subset(data_set,(as.Date(data_set$Date,"%d/%m/%Y")=="2007-02-02"
                              |as.Date(data_set$Date,"%d/%m/%Y")=="2007-02-01"))


##plotting data

png('plot2.png')
plot(x=seq(1,length(as.numeric(data_subset$Global_active_power)),1),as.numeric(data_subset$Global_active_power),type="l",ylab = "Global Active Power (Kilo watts)",xlab="", xaxt = "n")
axis(side=1, at=c(seq(0,length(as.numeric(data_subset$Global_active_power)),length(as.numeric(data_subset$Global_active_power))/2)), labels=c("Thu","Fri","Sat"))
dev.off()
