biseccion_un_paso <- function(fun, intervalo, tol = 1e-4) {
    izq <- intervalo[1]
    der <- intervalo[2]
    # Punto medio del intervalo
    medio <- (izq + der) / 2
    # Evaluo la función en los tres puntos
    f_medio <- fun(medio)
    f_izq <- fun(izq)

    if (f_izq * f_medio < 0) {
        der <- medio
    } else {
        izq <- medio
    }

    # Defino el siguiente intervalo
    intervalo_nuevo <- c(izq, der)
    # Chequeo la tolerancia
    flag <- abs(f_medio) < tol
    # Devuelvo el
    return(list(
        fun = fun,
        intervalo = intervalo_nuevo,
        flag = flag
    ))
}

iterar_funcion <- function(fun_iterar, fun, intervalo_inicial, tol = 1e-4) {
    intervalo <- intervalo_inicial
    salida <- FALSE
    while (!salida) {
        res <- fun_iterar(fun, intervalo, tol)
        intervalo <- res$intervalo
        salida <- res$flag
    }
    return(res)
}


###########################################################


### Bisección recursiva
biseccion_recursiva <- function(fun, intervalo, tol = 1e-4) {
    izq <- intervalo[1]
    der <- intervalo[2]
    # Punto medio del intervalo
    medio <- (izq + der) / 2
    # Evaluo la función en los tres puntos
    f_medio <- fun(medio)
    f_izq <- fun(izq)

    if (f_izq * f_medio < 0) {
        der <- medio
    } else {
        izq <- medio
    }

    intervalo_nuevo <- c(izq, der)
    flag <- abs(f_medio) < tol
    if (!flag) {
        ret <- biseccion_recursiva(fun, intervalo_nuevo)
        return(list(
            fun = fun,
            intervalo = intervalo_nuevo,
            flag = flag
        ))
    }
    # Cuando termina devuelvo el último resultado
    return(list(
        fun = fun,
        intervalo = intervalo_nuevo,
        flag = flag,
        ret = medio
    ))
}

iterar_funcion_track <- function(fun_iterar, fun, intervalo_inicial, tol = 1e-4) {
    intervalo <- intervalo_inicial
    salida <- FALSE
    trace <- c()
    while (!salida) {
        res <- fun_iterar(fun, intervalo, tol)
        intervalo <- res$intervalo
        salida <- res$flag
        trace <- c(trace, mean(intervalo))
    }

    return(trace)
}

a <- -1
b <- 3
tol <- 1e-4
x <- seq(a, b, by = tol)
intervalo <- c(a, b)

f1 <- function(x) {
    return(x^2 - 2)
}


sol <- iterar_funcion(biseccion_un_paso, f1, intervalo, tol)
print(sol)

trace <- iterar_funcion_track(biseccion_recursiva, f1, intervalo, tol)
print(trace)

colours <- c("blue", "red")
plot(x, f1(x), col = colours[1], type = "b", lwd = 1)
points(trace, f1(trace), col = colours[2], lwd = 6)
abline(h = 0)
abline(v = 0)

legend("right", legend = c("Real", "Iterations"), col = colours, pch = 15)
