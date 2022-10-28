
# Grafique los primeros n=100 términos de cada sucesión.

a_n <- function(n) {
    a <- (1 / sqrt(n)) + (1 / 2)^n
    return(a)
}
b_n <- function(n) {
    b <- (-1)^n + 5
    return(b)
}

c_n <- function(n) {
    c <- (3 * n - 6) / (16 * n^2 + n)
    return(c)
}


n <- 1:100

colores <- c("skyblue3", "orange", "red")
par(mfrow = c(1, 3))

plot(n, a_n(n), col = colores[1], ylab = "a_n", ylim = c(-1, 1))
abline(h = a_n(100000000))

plot(n, b_n(n), col = colores[2], ylab = "b_n")

plot(n, c_n(n), col = colores[3], ylab = "c_n")
abline(h = c_n(100000000))

legend("topright",
    legend = c("a_n", "b_n", "c_n"),
    col = colores, fill = colores
)

# Decida si las sucesiones son convergentes y en tal caso agregue una
# línea horizontal al gráfico.

# La primer y tercer sucesión convergen a un valor
# (tienden a cero en el infinito). Por otro lado,
# la segunda sucesión no converge a ningún valor
