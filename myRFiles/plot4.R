## Read data. Previously, we must set the working directory where the file is stored.
datos <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
str(datos)

## Convert de Date column from factor to date
datos[, 1] <- as.Date(datos[, 1], format = "%d/%m/%Y")
str(datos)

## Subsetting data
datos2 <- datos[datos$Date == "2007-2-1" | datos$Date == "2007-2-2", ]
rm(datos)

library(datasets)

## Make a vector with the join of Date and Time
concatenar <- paste(datos2$Date, datos2$Time, sep = " ")
totime = strptime(concat,"%Y-%m-%d %H:%M:%S")

## We don't use dev.copy because the legend wasn't exported correctly
png(filename = "plot4.png")
par(mfrow = c(2, 2))

## plotting 1
plot(totime, datos2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## plotting 2
plot(totime, datos2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## plotting 3
plot(totime, datos2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(totime, datos2$Sub_metering_2, col = "red")
lines(totime, datos2$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plotting 4
plot(totime, datos2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()