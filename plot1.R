plot1 <- function(){

        data <- data <- read.table("household_power_consumption.txt" , 
                                   header = TRUE , sep = ";" )
                         
        data <- mutate(data , Date=as.Date(Date , "%d/%m/%Y"))
        data <- filter(data , Date=="2007-02-01"| Date=="2007-02-02" )
        
        hist(as.numeric(as.character(data$Global_active_power))  , col="red" , 
             xlab = "Global Active Power (Kilowatt)" , ylab="Frequency" ,
             main = "Global Active Power" )
        
        dev.copy(png , file="plot1.png" , width= 480 , height=480)
        dev.off()
}