install.packages("faraway")
library(faraway)

?worldcup

head(worldcup)

set.seed(19)

dim(worldcup)

unique(worldcup$Team)

numero_paises_elegidos <- sample(1:32,4,replace = FALSE)
numero_paises_elegidos
paises_elegidos <- unique(worldcup$Team)[numero_paises_elegidos]

paises_elegidos

muestra <- worldcup[worldcup$Team %in% paises_elegidos,]

View(muestra)

############################################################################

pais1 <- worldcup[worldcup$Team == "Slovakia",]
pais2 <- worldcup[worldcup$Team == paises_elegidos[2],]
pais3 <- worldcup[worldcup$Team == paises_elegidos[3],]
pais4 <- worldcup[worldcup$Team == paises_elegidos[4],]

set.seed(28)

dim(pais1)[1]
nrow(pais1)

dim(pais2)
dim(pais3)
dim(pais4)

jugadores_pais1 <- sample(1:dim(pais1)[1],5,replace = FALSE)
jugadores_pais2 <- sample(1:nrow(pais2),5,replace = FALSE)
jugadores_pais3 <- sample(1:dim(pais3)[1],5,replace = FALSE)
jugadores_pais4 <- sample(1:dim(pais4)[1],5,replace = FALSE)

jugadores_pais1

muestra_worldcup <- rbind(pais1[jugadores_pais1,],pais2[jugadores_pais2,],
                          pais3[jugadores_pais3,],pais4[jugadores_pais4,])

