# Construya una función es_cuadrado_perfecto que devuelva un booleano según
# el input x es o no un cuadrado perfecto (existe k tal que k2)

es_cuadrado_perfecto <- function(x) {
    k <- as.integer(sqrt(x))
    is_perfect_square <- (x == k * k)
    return(is_perfect_square)
}

print(es_cuadrado_perfecto(1))
print(es_cuadrado_perfecto(pi))
print(es_cuadrado_perfecto(12))
print(es_cuadrado_perfecto(100))
