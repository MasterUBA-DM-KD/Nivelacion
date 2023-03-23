sumar_naturales <- function(n) {
    suma <- 0
    for (i in 1:n) {
        suma <- suma + i
    }
    return(suma)
}

library("rbenchmark")

n <- 1000000
benchmark(sumar_naturales(n), sum(1:n))
# Sumar naturales es mucho más lento
