# deklaracja biblioteki 
library("stringr")
# hotfix do polskiej czcionki

Sys.setlocale("LC_CTYPE", "polish")
# Czytanie pliku
df <- read.csv(".\\Arkusze\\Rankingi csv\\Doktorat_obliczenia_EU-28_2006_wzorzec.csv", header = TRUE, encoding = "UTF-8")

# zmienne pomocnicze
lista <- 0:28
x <- c(0,df$zi)
x2 <- c(0,df2$zi)
y = lista
Średnia = df$sr[1]
Punkt1 = df$p1[1] 
Punkt2 = df$p2[1]

# plotowanie
plot(x, y, col=ifelse(x==0, "white", "blue"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n",cex= 2)
#plot(x2, y, col=ifelse(x2==0, "white", "red"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n")
points(x2,y, col=ifelse(x==0, "white", "red"),cex= 2)

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
  
  # wygładzenie pomocnicze
  #scatter.smooth(x[1:29], y[1:29])
  # regresja liniowa
  
  linear_model = lm(y~x,data=df)
  
  #abline(linear_model)
  text(x[2:29]-(0.05),y[2:29], labels=df$symbolh, cex= 0.7, pos=4)
  text(x2[2:29]*1.01,y[2:29], labels=df2$symbolh, cex= 0.7,  pos=4, col = "red")
  summary(linear_model)
  summary(linear_model$coefficients)
  