# Una empresa regala una heladera al azar entre N personas.
# Repite el proceso n veces. ¿Cuál es la probabilidad de que una persona
# reciba dos heladeras?

# Primero escriba una función que simule una sola realización del sorteo.
# Usá el siguiente modelo:

una_heladera <- function(N, n) {
    prob <- 1 / N

    dos_heladeras_prob <- dbinom(1, n, prob)
    return(dos_heladeras_prob)
}

k <- 1000
N <- 40000000
n <- 15000
reps <- replicate(k, una_heladera(N, n))

print(una_heladera(N, n))

# Calcule la media muestral de reps, ¿qué representa?
# Por la ley de los números grandes representa la esperanza E[X]
# Hecho que se puede confirmar con el valor de la esperanza de X ~ Bin(n,p)
# Sea E[X] = np

print("Promedio repeticiones: ")
print(mean(reps))
print("Esperanza E[X]=np, X~Bin(n, p)")
print(n * 1 / N)
