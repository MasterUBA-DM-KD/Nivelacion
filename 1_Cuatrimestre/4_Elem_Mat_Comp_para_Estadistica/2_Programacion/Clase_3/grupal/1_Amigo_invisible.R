sorteo_valido <- function(n) {
    is_valid <- TRUE
    sorteo <- sample(n, n)

    while (is_valid) {
        for (i in seq_along(sorteo)) {
            if (i == sorteo[i]) {
                is_valid <- FALSE
                break
            }
        }
        return(list(flag = is_valid, sorteo = sorteo))
    }
}

cuantos_sorteos <- function(n) {
    n_sorteos <- 1
    is_valid <- sorteo_valido(n)$flag

    while (!is_valid) {
        is_valid <- sorteo_valido(n)$flag
        n_sorteos <- n_sorteos + 1
    }

    return(n_sorteos)
}

regalos_cruzados <- function(n) {
    i <- 1
    orden <- sorteo_valido(n)$sorteo
    is_cruzado <- FALSE

    while (i < length(orden)) {
        if ((i == orden[i + 1]) && (i + 1 == orden[i])) {
            is_cruzado <- TRUE
            break
        }
        i <- i + 1
    }
    return(is_cruzado)
}

N <- 3:15
n_reps <- 10000
prob_exitos <- c()
avg_sorteos <- c()
prob_cruzados <- c()

for (n in N) {
    reps <- replicate(n_reps, sorteo_valido(n)$flag)
    prob_exitos <- c(prob_exitos, mean(reps))

    reps_sorteos <- replicate(n_reps, cuantos_sorteos(n))
    avg_sorteos <- c(avg_sorteos, ceiling(mean(reps_sorteos)))

    reps_cruzados <- replicate(n_reps, regalos_cruzados(n))
    prob_cruzados <- c(prob_cruzados, mean(reps_cruzados))
}

par(mfcol = c(1, 3))
plot(N,
    prob_exitos,
    ylab = "Probabilidad de éxito",
    xlab = "Número participantes",
    type = "l", lty = 2, lwd = 3,
    ylim = c(0, 1),
    main = "Probabilidad de hacer un sorteo válido"
)
points(N, prob_exitos, col = "red", lwd = 5)

plot(N,
    avg_sorteos,
    ylab = "Número de sorteos",
    xlab = "Número participantes",
    type = "l", lty = 2, lwd = 3,
    main = "Promedio de sorteos hasta alcanzar uno válido"
)
points(N, avg_sorteos, col = "red", lwd = 5)

# ¿cuál es la probabilidad de que haya dos personas tales que
# cada una le hace regalo a la otra?

plot(N,
    prob_cruzados,
    ylab = "Probabilidad regalos cruzados",
    xlab = "Número participantes",
    type = "l", lty = 2, lwd = 3,
    main = "Probabilidad regalo cruzado",
    ylim = c(0, 1)
)
points(N, prob_cruzados, col = "red", lwd = 5)

# La probabilidad disminuye si aumenta el número de participantes
