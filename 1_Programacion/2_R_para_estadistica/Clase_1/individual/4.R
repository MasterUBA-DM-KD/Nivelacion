# Arme una función que dado un vector numérico x devuelve un vector con la
# media muestral y, la mediana. Use el siguiente modelo como base:


medias <- function(x) {
    return(c(mean(x), median(x)))
}

print(medias(c(1)))
print(medias(c(4)))
print(medias(c(1, 2, 3, 4, 4, 4, 45)))

# Una vez definida la función medias ejecute la siguente línea:

replicaciones <- replicate(10000, medias(rnorm(100)))

# Extraiga de la matriz replicaciones las medias y medianas, y asígnelas a
# los vectores las_medias y las_medianas respectivamente.
# Luego ejecute el siguiente código para graficar.

colores <- c("skyblue3", "orange")
densidades <- c(50, 30)
las_medias <- replicaciones[1, ]
hist(las_medias, density = densidades[1], col = colores[1])
las_medianas <- replicaciones[2, ]
hist(las_medianas, density = densidades[2], col = colores[2], add = TRUE)
legend("topright",
    legend = c("media", "mediana"),
    col = colores, density = densidades, fill = colores
)
