

pol_lagrange <- function(x, xi, idx) {
    L_i <- 1.
    for (i in 1:length(xi))
    {
        if (i != idx) {
            L_i <- L_i * ((x - xi[i]) / (xi[idx] - xi[i]))
        }
    }
    return(L_i)
}

eval_pol_lagrange <- function(x, xi, yi) {
    f_aprox <- 0.
    for (idx in 1:length(xi)) {
        f_aprox <- f_aprox + yi[idx] * pol_lagrange(x, xi, idx)
    }
    return(f_aprox)
}

interpolador <- function(xi, yi) {
    f_interpolador <- function(x) {
        return(eval_pol_lagrange(x, xi, yi))
    }
    return(f_interpolador)
}

interpolar_lagrange <- function(xi, yi, n) {
    xs <- seq(min(xi), max(xi), length = n)
    ys <- Map(interpolador(xi, yi), xs)

    return(list(xs, ys))
}


graficar_interpolador <- function(a, b, n, func, func_n = "") {
    xi <- seq(a, b, length.out = n + 1)
    yi <- func(xi)


    x_graph <- seq(a, b, by = 0.1)
    y_graph <- func(x_graph)

    x_y <- interpolar_lagrange(xi, yi, n)
    x_s <- x_y[[1]]
    y_s <- x_y[[2]]


    colours <- c("red", "green")
    plot(x_graph, y_graph,
        type = "l", col = colours[1], , lwd = 2,
        xlab = "x", ylab = "f(x)", main = func_n
    )
    points(x_s, y_s, type = "b", col = colours[2], lwd = 2)
    legend("right", legend = c("Real", "Lagrange"), pch = 15, col = colours)
}


a <- -1
b <- 1
n <- 10

func <- function(z) {
    return(z^2)
}

graficar_interpolador(a, b, n, func, "x^2")
