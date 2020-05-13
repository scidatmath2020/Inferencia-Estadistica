library(tidyverse)
library(nortest)

tabla_anova <- function(tabla_original){
  a = do.call(what = rbind,
              args = sapply(tabla_original,function(x){
                data.frame(X = as.numeric(x[-1]),
                           F = rep(x[1],length(x[-1])))
              },
              simplify = FALSE)
  )
  a[!(a$X %in% c(NA)),]
}



tabla_dos_vias <- function(x,y){
  V <- do.call(rbind,
               mapply(function(x,y){data.frame(x,B = y)},
                      lapply(x,function(x){a <- tabla_anova(x)}),
                      y,
                      SIMPLIFY = FALSE
               )
  )
  names(V)[2] <- "A"
  V
}

##############################

TB1 <- read_tsv("C:\\Users\\hp master\\OneDrive\\Escritorio\\tabla1.txt",col_names = FALSE)
TB2 <- read_tsv("C:\\Users\\hp master\\OneDrive\\Escritorio\\tabla2.txt",col_names = FALSE)

L=list(TB1,TB2)

tabla_peces <- tabla_dos_vias(L,c("27C","16C"))

names(tabla_peces) <- c("GSI","Fotoperiodo","Temperatura")

ggplot(data = tabla_peces,mapping = aes(x=Fotoperiodo,y=GSI)) +
  geom_boxplot() +
  stat_summary(fun = mean,geom = "point") +
  labs(x="Fotoperiodo", y="GSI") 

ggplot(data = tabla_peces,mapping = aes(x=Temperatura,y=GSI)) +
  geom_boxplot() +
  stat_summary(fun = mean,geom = "point") +
  labs(x="Temperatura", y="GSI") 

boxplot(GSI~Fotoperiodo*Temperatura,data = tabla_peces)

summary(aov(GSI~Fotoperiodo*Temperatura,tabla_peces))
summary(aov(GSI~Fotoperiodo:Temperatura,tabla_peces))

Fotoperiodo <- tabla_peces$Fotoperiodo
Temperatura <- tabla_peces$Temperatura
GSI <- tabla_peces$GSI

interaction.plot(Temperatura,Fotoperiodo,GSI,xlab="Temperatura",ylab="GSI",trace.label="Hola")


