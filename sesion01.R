setwd("C:\\Users\\hp master\\Documents\\SciData\\Inferencia_Estadistica\\Enpecyt_2017")

install.packages("foreign")
install.packages("tidyverse")

library(foreign)
library(tidyverse)

read.dbf("enpecyt2017_cb1.dbf") -> cb1

nivel_estudios <- tapply(cb1$FAC,cb1$S3P1,sum)

niveles_estudios <- c("Ninguno","Preescolar","Primaria","Secundaria","Preparatoria","Normal","TSU","Licenciatura","Especialidad",
          "Maestría","Doctorado")

nivel_estudios <- data.frame(niveles_estudios,nivel_estudios)
names(nivel_estudios) <- c("grado","absoluto")


nivel_estudios$relativo <- nivel_estudios$absoluto/sum(nivel_estudios$absoluto)

ggplot(data = nivel_estudios) +
  geom_col(mapping = aes( x=grado, y= absoluto, fill =  grado))


ggplot(data = nivel_estudios) +
  geom_col(mapping = aes( x=grado, y= 100*relativo, fill =  grado))


etiquetas_nivel <- paste(nivel_estudios$grado, round(100*nivel_estudios$relativo,2),"%",sep=" ")

pie(nivel_estudios$relativo,etiquetas_nivel)


cb1$grupo <- 0


cb1[cb1$S3P1 %in% c(0),]$grupo <- 0
cb1[cb1$S3P1 %in% c(1,2,3),]$grupo <- 1
cb1[cb1$S3P1 %in% c(4),]$grupo <- 2
cb1[cb1$S3P1 %in% c(5,6,7),]$grupo <- 3
cb1[cb1$S3P1 %in% c(8,9,10),]$grupo <- 4



grupo_estudios <- tapply(cb1$FAC,cb1$grupo,sum)

grupos_estudios <- c("Ninguno","Básico","Medio superio","Superior","Posgrado")

grupo_estudios <- data.frame(grupos_estudios,grupo_estudios)
names(grupo_estudios) <- c("grado","absoluto")


grupo_estudios$relativo <- grupo_estudios$absoluto/sum(grupo_estudios$absoluto)

etiquetas_grupo <- paste(grupo_estudios$grado, round(100*grupo_estudios$relativo,2),"%",sep=" ")

pie(grupo_estudios$relativo,etiquetas_grupo)




