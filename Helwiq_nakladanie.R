

# Bibioteki Cairo, devtools, dplyr potrzebne


# hotfix do polskiej czcionki
library(dplyr)
encoding = "utf-8"
Sys.setlocale("LC_CTYPE", "polish")
# Czytanie pliku
plik = "./Arkusze/Rankingi csv/Doktorat_obliczenia_EU-28_2016.csv"
#plik2 = "./Arkusze/Rankingi csv/Doktorat_obliczenia_EU-28_2017.csv"
#plik3 = "./Arkusze/Rankingi csv/Doktorat_obliczenia_EU-28_2017.csv"
#df <- read.csv(plik, header = TRUE)
#df <- read.csv(plik2, header = TRUE)
#df <- read.csv(plik3, header = TRUE)
# zmienne pomocnicze
lista <- 0:28
x <- c(0,df$zi)

y = lista
Średnia = df$sr[1]
Punkt1 = df$p1[1] 
Punkt2 = df$p2[1]

# plotowanie
regexy <- gsub(".csv", "", plik) %>% gsub("./Arkusze/Rankingi/", "", .)

png(filename = paste0("./Wyniki/Rankingi/", regexy, ".png"),
    width = 1000, height = 770, units = "px")

#cairo_ps(paste0(regexy, ".eps"), width = 10, height = 7.7)
plot(x, y, col=ifelse(x==0, "white", "blue"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n",cex= 2)



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
  text(x[2:29],y[2:29], labels=df$symbolh, cex= 0.8, pos=2.5)
  
  summary(linear_model)
  summary(linear_model$coefficients)
  
  dev.off()