'df <- as.data.frame(read.table("C:\\Users\\josep\\Desktop\\cursos\\exploratoryDataAnalisys\\household_power_consumption.txt",sep = ";",header = TRUE))

df <- transform(df , Date = as.Date(df$Date,"%d/%m/%Y") , 
                Time = format(as.POSIXct(df$Time,format="%H:%M:%S") , "%H:%M:%S")
)
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
df[,3:(dim(df)[2] - 1)] <- sapply(df[,3:(dim(df)[2] - 1)], function(x) as.numeric(levels(x)[x])  )

'
par(mfcol = c(2,2))
with(df , {
      plot(as.POSIXct(paste(Date, Time) ,format= "%Y-%m-%d %H:%M:%S") , 
           Global_active_power, 
           type = "l",
           ylab = "Global Active Power (kilowatts)" , 
           xlab = ""
      )
      {
        with(df , plot( as.POSIXct(paste(Date, Time) ,format= "%Y-%m-%d %H:%M:%S"),
                        Sub_metering_1 ,
                        type = "l",
                        ylab = "Energy sub metering" , 
                        xlab = "",
                        col = "black"
                  )
        )
        with(df , lines(as.POSIXct(paste(Date, Time) ,format= "%Y-%m-%d %H:%M:%S") , 
                        Sub_metering_2,
                        col = "red"
                  )
        )
        
        
        with(df , lines(as.POSIXct(paste(Date, Time) ,format= "%Y-%m-%d %H:%M:%S") , 
                        Sub_metering_3,
                        col = "blue"
                  )
        )
        
        legend("topright" , pch = "-", col = c("black" , "red" , "blue"), 
               legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"),lty=1)    
      }
      plot(as.POSIXct(paste(Date, Time) ,format= "%Y-%m-%d %H:%M:%S") , 
           Voltage, 
           type = "l",
           ylab = "Voltage" , 
           xlab = "Datetime"

      )
      plot(as.POSIXct(paste(Date, Time) ,format= "%Y-%m-%d %H:%M:%S"),
           Global_reactive_power , 
           xlab = "Datetime",
           ylab = "Global_reactive_power",
           type = "h"
      )
    }
  )

dev.copy(png , file = "plot4.png" , width = 480 , height = 480)
dev.off()
