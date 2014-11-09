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

## Plotting data
with(datos2, plot(totime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)"))

## Save histogram in a png file
dev.copy(png, file="plot2.png")
dev.off()