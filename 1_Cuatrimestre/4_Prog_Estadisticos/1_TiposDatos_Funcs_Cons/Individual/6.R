
# Grafique los primeros n=100 términos de cada sucesión.

n <- seq(1, 10000, 1)

a_n <- (1 / sqrt(n)) + (1 / 2)^n
b_n <- (-1)^n + 5
c_n <- (3 * n - 6) / (16 * n^2 + n)

colores <- c("skyblue3", "orange", "red")
par(mfrow = c(1, 3))

plot(n, a_n, col = colores[1])
abline(h = tail(a_n, n = 1))

plot(n, b_n, col = colores[2])
abline(h = tail(b_n, n = 1))

plot(n, c_n, col = colores[3])
abline(h = tail(c_n, n = 1))

legend("topright",
    legend = c("a_n", "b_n", "c_n"),
    col = colores, fill = colores
)
