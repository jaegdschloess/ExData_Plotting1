# Load in the household energy usage data into a data frame

setwd("D:/Learning/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

# household_power_consumption.txt must be in working directory for script to
# succeed. Read and transform data so plot can be reproduced exactly
all_readings <- read.table("household_power_consumption.txt",sep=";"
                           ,stringsAsFactors=FALSE,na.strings="?",header=T)

# convert chr Date + Time variables to POSIXlt class for usability purposes
# (i.e. performing date math )
all_readings$datetime <-
    strptime(paste(all_readings$Date,all_readings$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

# Subset down to dates of interest 2007-02-01 through 2007-02-02 (aka < 2007-02-03)
readings <- 
    subset(all_readings,datetime >= as.POSIXlt("2007-02-01") 
           & datetime < as.POSIXlt("2007-02-03"))


# Create plot 3
par(mfrow=c(1,1))
png(filename="plot3.png")
# Create a plot with datetime on the X axis, and energy sub metering on the Y
# axis
with(readings,plot(datetime,Sub_metering_1,
                   type = "n",
                   xlab="",
                   ylab="Energy sub metering"))
with(readings,points(datetime,Sub_metering_1,col="black",type="l"))
with(readings,points(datetime,Sub_metering_2,col="red",type="l"))
with(readings,points(datetime,Sub_metering_3,col="blue",type="l"))
legend("topright",lty="solid",lwd=1,col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()