'df <- as.data.frame(read.table("C:\\Users\\josep\\Desktop\\cursos\\exploratoryDataAnalisys\\household_power_consumption.txt",sep = ";",header = TRUE))

df <- transform(df , Date = as.Date(df$Date,"%d/%m/%Y") , 
                     Time = format(as.POSIXct(df$Time,format="%H:%M:%S") , "%H:%M:%S")
                )
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
df[,3:(dim(df)[2] - 1)] <- sapply(df[,3:(dim(df)[2] - 1)], function(x) as.numeric(levels(x)[x])  )
'
par(mfcol = c(1,1))
hist(df$Global_active_power , xlab = "Global Active Power (kilowatts)" , main = "Global Active Power" , col="red")

dev.copy(png , file = "plot1.png" , width = 480 , height = 480)
dev.off()
