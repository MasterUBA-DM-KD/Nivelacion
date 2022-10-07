# Cree una funciòn que dado un cuadrado, a partir de la
# variable base, calcule su perímetro y su área.

p_a_cuadrado <- function(base) {
  perimetro <- base * 4
  area <- base^2

  return(c(perimetro, area))
}


print(p_a_cuadrado(2))
print(p_a_cuadrado(pi))
print(p_a_cuadrado(10))
