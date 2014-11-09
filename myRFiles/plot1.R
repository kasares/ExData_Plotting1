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

## Create the histogram
histinfo <- hist(datos2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (KiloWatts)")

## Save histogram in a png file
dev.copy(png, file="plot1.png")
dev.off()