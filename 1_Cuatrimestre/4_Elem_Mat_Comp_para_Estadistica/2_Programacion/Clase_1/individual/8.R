# 8. Grafique el polinomio interpolador de Lagranges en n+1
# puntos equiespaciados en el intervalo [−1,1], con n=5,10,15, para los valores
# generados por las siguientes funciones:

pol_lagranges <- function() {
    return(0)
}

n <- seq(-1.5, 1.5, length.out = 5)
f_x <- tan(n)

x <- seq(-1.5, 1.5, length.out = 100)

for (i in seq(length(n) - 1)) {
    print(i)
    print(i + 1)
}
