juego_123 <- function() {
    ganamos <- TRUE
    cartas <- sample(1:52, 3, replace = FALSE)

    for (i in seq_along(cartas)) {
        if (cartas[i] == i) {
            ganamos <- FALSE
            return(ganamos)
        }
    }

    return(ganamos)
}

proporcion_ganancias <- function(n) {
    reps <- replicate(n, juego_123())
    ganancias <- sum(reps)
    prop <- ganancias / length(reps)

    return(prop)
}

library("rbenchmark")

n <- 1000
benchmark(proporcion_ganancias(n), mean(replicate(n, expr = juego_123)))
