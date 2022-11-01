rm(list = ls()) # borra todo lo que hay en memoria

valores_n <- seq(from = 1, to = 10, by = 1)
a_n <- c()
for (mongo in valores_n)
{
  nuevo_valor <- 1 / sqrt(mongo) + (1 / 2)^mongo #** = ^potencia
  a_n <- c(a_n, nuevo_valor)
}

plot(valores_n, a_n)


# R oriented version
a_n_bis <- 1 / sqrt(valores_n) + (1 / 2)^valores_n

a_n == a_n_bis

###
# Guia 3 ej 13
suc_a <- function(n) {
  mongo <- 1 / sqrt(n) + (1 / 2)^n
  mongo # return(salida) para R la ultima linea es el return.
}
suc_a(1)
suc_a(1589)

a_n_bis_bis <- c()
for (mongo in valores_n)
{
  nuevo <- suc_a(mongo)
  a_n_bis_bis <- c(a_n_bis_bis, nuevo)
}

# R oriented - calcula la funcion en cada coordenada.
suc_a(valores_n)


###################################
###################################
# Escribir una función que tome un valor `a` y un vector `vec`.
# La misma deberá indicar cuántas veces el valor a aparece en el
# vector vec. Pensar 2 implementaciones: con `for` y con `while`.

frecuencia <- function(a, vec) {
  n <- length(vec)
  contador <- 0 # inicializamos antes de arrancar
  for (i in 1:n) # i representa una posicion del vector
  {
    if (vec[i] == a) {
      contador <- contador + 1
    }
  }
  contador # return(contador)
}

#############################
# dados de aplicacion
dado_azul <- c(3, 2, 3, 5, 4, 2, 1, 5, 2, 1, 2, 2, 3, 5, 1)
dado_rojo <- c(4, 6, 3, 1, 1, 4, 6, 1, 3, 1, 5, 2, 3, 4, 2)
suma <- dado_rojo + dado_azul

frecuencia(7, suma) / length(suma)

frecuencia(2, suma) / length(suma)

frecuencia(10, suma) / length(suma) + frecuencia(11, suma) / length(suma) + frecuencia(12, suma) / length(suma)


contador_dados_iguales <- 0
for (i in 1:length(suma))
{
  if (dado_azul[i] == dado_rojo[i]) {
    contador_dados_iguales <- contador_dados_iguales + 1
  }
}


sum(1 * (dado_azul == dado_rojo))

sum(dado_azul == dado_rojo) # frecuencia
sum(dado_azul == dado_rojo) / length(suma)

mean(dado_azul == dado_rojo) # frecuencia relativa.

frecuencia_bis <- function(a, vec) {
  salida <- sum(vec == a)
  salida
}


frecuencia(TRUE, dado_azul == dado_rojo)
