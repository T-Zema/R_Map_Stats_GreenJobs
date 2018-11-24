library("sp")
library("rgdal")


Belgia.map <- readOGR(dsn=".\\Pliki_shapefile", "BEL_adm2")
print ("dane poprawnie wpisane do klasy europe.map")
class(Belgia.map)
print(ncol(Belgia.map@data))
print (typeof(Belgia.map$NAME))
print(Belgia.map@data)

plot(Belgia.map)
plot(Belgia.map[Belgia.map$VARNAME_2 == "Fiandra Occidentale|Flandes Occidental|Flandre occidentale|Flandres Ocidental|West Flandern|West Flanders", ], col = "darkolivegreen4", add = TRUE)