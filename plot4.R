plot4 <- function(){
        
        data <- data <- read.table("household_power_consumption.txt" , 
                                   header = TRUE , sep = ";" )
        
        data <- mutate(data , Date=as.Date(Date , "%d/%m/%Y"))
        data <- filter(data , Date=="2007-02-01"| Date=="2007-02-02" )
        
        date_time_char <- paste(data$Date , data$Time , sep= " ")
        date_time <- strptime( date_time_char, "%Y-%m-%d %H:%M:%S")
        
        par(mfrow=c(2,2))
        
        plot(date_time , as.numeric(as.character(data$Global_active_power)) ,type = "l" 
             , xlab = "" , ylab = "Global Active Power (Kilowatts)")
        
        plot(date_time , as.numeric(as.character(data$Voltage)), type="l" ,
             xlab="datetime" , ylab="Voltage" )
        
        
        
        
        plot(date_time , as.numeric(as.character(data$Sub_metering_1)) , type = "n",
             xlab = " " , ylab="Energy sub metering")
        
        with(data , lines(date_time , as.numeric(as.character(data$Sub_metering_1)) ,
                          type="l" ))
        with(data , lines(date_time , as.numeric(as.character(data$Sub_metering_2)) ,
                          type="l" , col="red" ))
        with(data , lines(date_time , as.numeric(as.character(data$Sub_metering_3)) ,
                          type="l" , col="blue" ))
        
        legend("topright" , col=c("black" , "red" , "blue") ,lty = c(1,1),lwd = c(1,1),
              legend = c("Sub_metering_1","Sub_metering_2" , "Sub_metering_3")
               , bty="n")
        
        plot(date_time , as.numeric(as.character(data$Global_reactive_power)), type="l" ,
             xlab="datetime" , ylab="Global Reactive Power" )
        
        dev.copy(png , file="plot4.png" , width= 480 , height=480)
        dev.off()
        
        
        
}