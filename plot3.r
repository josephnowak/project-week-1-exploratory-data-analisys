'df <- as.data.frame(read.table("C:\\Users\\josep\\Desktop\\cursos\\exploratoryDataAnalisys\\household_power_consumption.txt",sep = ";",header = TRUE))

df <- transform(df , Date = as.Date(df$Date,"%d/%m/%Y") , 
                Time = format(as.POSIXct(df$Time,format="%H:%M:%S") , "%H:%M:%S")
)
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
df[,3:(dim(df)[2] - 1)] <- sapply(df[,3:(dim(df)[2] - 1)], function(x) as.numeric(levels(x)[x]))
'
par(mfcol = c(1,1))

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

dev.copy(png , file = "plot3.png", width = 480 , height = 480)
dev.off()
