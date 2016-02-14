## make sure the data file and the plot2.R are in the same folder
## Load data table
fileName <- "./household_power_consumption.txt"
data <- read.table(fileName,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
dim(data) # 2075259 9
attach(data)

## 2 days of data in Feb, 2007.
//subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[(Date == "1/2/2007" | Date == "2/2/2007"), ]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData) # 2880   10
attach(newData)



#create plot 2
png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()