# Considere las siguientes funciones:
# l_1 = |x|
# l_2 = x^2
# ρ_k = x^2 • I_{(|x|≤k)} + 2k|x| - k^2 • I_{(|x|>k)}
# Grafique ρ_k con k=5 junto a las otras funciones con distintos colores
# y una leyenda.

i_x_leq_k <- function(x, k) {
    return(ifelse(abs(x) <= k, 1, 0))
}

i_x_g_k <- function(x, k) {
    return(ifelse(abs(x) > k, 1, 0))
}

l_1 <- function(x) {
    return(abs(x))
}

l_2 <- function(x) {
    return(x^2)
}

rho_k <- function(x, k) {
    rho <- l_2(x) * i_x_leq_k(x, k) + 2 * k * l_1(x) - k^2 * i_x_g_k(x, k)
    return(rho)
}


k <- 5
x <- -10:10
colores <- c("skyblue3", "orange", "red")

plot(x, l_1(x), , type = "o", col = colores[1], pch = "o", ylab = "y", lty = 1)

points(x, l_2(x), col = colores[2], pch = "*")
lines(x, l_2(x), col = colores[2], lty = 2)

points(x, rho_k(x, k), col = colores[3], pch = "+")
lines(x, rho_k(x, k), col = colores[3], lty = 3)

legend("bottomleft",
    legend = c("l1(x)", "l2(x)", "rhok(x)"), col = colores,
    pch = c("o", "*", "+"), lty = c(1, 2, 3), ncol = 1
)
