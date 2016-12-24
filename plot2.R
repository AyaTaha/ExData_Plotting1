plot2 <- function(){
        
        data <- data <- read.table("household_power_consumption.txt" , 
                                   header = TRUE , sep = ";" )
        
        data <- mutate(data , Date=as.Date(Date , "%d/%m/%Y"))
        data <- filter(data , Date=="2007-02-01"| Date=="2007-02-02" )
        
        date_time_char <- paste(data$Date , data$Time , sep= " ")
        date_time <- strptime( date_time_char, "%Y-%m-%d %H:%M:%S")
        plot(date_time , as.numeric(as.character(data$Global_active_power)) ,type = "l" 
             , xlab = "" , ylab = "Global Active Power (Kilowatts)")
        
        dev.copy(png , file="plot2.png" , width= 480 , height=480)
        dev.off()
}