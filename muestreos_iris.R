head(iris)

summary(iris$Species)

### Qjuiero escoger 10 flores con reposición.

set.seed(4)
sample(1:150,10, replace = TRUE)

set.seed(4)
iris[filas, columnas]

iris[sample(1:150,10, replace = TRUE),]
iris[sample(1:150,10, replace = FALSE),]

View(iris)



set.seed(16042020)

muestra_setosa <- sample(1:50,10,replace = TRUE)
muestra_versicolor <- sample(51:100,10,replace = TRUE)
muestra_virginica <- sample(101:150,10,replace = TRUE)

muestra_estr <- rbind(iris[muestra_setosa,], iris[muestra_versicolor,], iris[muestra_virginica,  ])


set.seed(30)
permutacion <- sample(1:150,150,replace = FALSE)

iris_permutado <- iris[permutacion,]

iris_permutado_setosa <- iris_permutado[iris_permutado$Species == "setosa",]
iris_permutado_setosa_muestra <- iris_permutado_setosa[10,]
iris_permutado_setosa_muestra

## Aunque la manera mas sencilla es corregir la tabla desde el principio

order(iris_permutado$Species)

iris_ordenado <- iris_permutado[order(iris_permutado$Species),]
   
sort(c("hola","como","estas")) # ordena de manera ascendente y devuelve el arreglo de manera ordenada

order(c("hola","como","estas")) # ordena de manera ascendente y devuelve el arreglo de índices de manera ordenada



iris_ordenado