# deklaracja biblioteki "sp"
library("sp")
library("RColorBrewer")
# Czytanie pliku
#df <- read.table(".\\Rysunek\\Doktorat_obliczenia_EU-28_2006.csv", header = TRUE)
df <- read.csv(".\\Rysunek\\Doktorat_obliczenia_EU-28_2016.csv", header = TRUE)
# zmienne pomocnicze
lista <- 0:28
x <- c(0,df$zi)

y = lista
Średnia = df$sr[1]
Punkt1 = df$p1[1] 
Punkt2 = df$p2[1]

# plotowanie
plot(x, y, col=ifelse(x==0, "white", "blue"), xlab="wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n")



  # zmienna pomocnicza
  axis_seqx <- seq(0, 1, length.out = 11)
  axis_seqy <- seq(0, 28, length.out = 29)
  # zmiana osi
  axis(side=1,at=axis_seqx,lwd=1)
  axis(side=2,at=axis_seqy,lwd=1)
  # linie 
  abline(v = Średnia, col = "gray60", lwd = 2, lty = 2)
  abline(v = Punkt1, col = "gray60", lwd = 2, lty = 2)
  abline(v = Punkt2, col = "gray60", lwd = 2, lty = 2)
  
  # Znaczniki dla linii
  mtext(expression(bar("Z") -"S"[d]), line = 0, at = Punkt1)
  mtext(expression(bar("Z") + "S"[d]), line = 0, at = Punkt2)
  mtext(expression(bar("Z")), line = 0.2, at = Średnia)
  