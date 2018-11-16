library("sp")
library("rgdal")


print ("To jest mój pierwszy program w R xD")


























poland.map <- readOGR(dsn="C:\\Users\\zemat\\Documents\\Rrr", "województwa") #argumentami są nazwa folderu oraz nazwa pliku (nie podajemy rozszerzenia)
#poland.map <- readOGR(dsn=path.expand("~/Rrr", "wojewĂłdztwa")
print ("dane poprawnie wpisane do klasy poland.map")

class(poland.map)
ncol(poland.map@data)
poland.map@data <- poland.map@data[ , c(6,16)]
names(poland.map@data) <- c("nazwa", "powierzchnia")
head(poland.map@data, n=4)
# Header 1 
plot(poland.map)
plot(poland.map[poland.map$nazwa == "wielkopolskie", ], col = "green", add = TRUE)
plot(poland.map[poland.map$nazwa == "lubuskie", ], col = "green3", add = TRUE)
print(summary(poland.map))
