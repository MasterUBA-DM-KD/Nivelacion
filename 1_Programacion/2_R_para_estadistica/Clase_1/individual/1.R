# Una funciòn que convierta una temperatura en grados Celsius a grados Fahrenheit

celsius_to_farenheit <- function(temperature_celsius) {
  temperature_farenheit <- temperature_celsius * 9 / 5 + 32
  return(temperature_farenheit)
}

print(celsius_to_farenheit(-100))
print(celsius_to_farenheit(0))
print(celsius_to_farenheit(100))

# Otro programa que se haga la operación inversa (de Fahrenheit a Celsius)
farenheit_to_celsius <- function(temperature_farenheit) {
  temperature_celsius <- (temperature_farenheit - 32) * 5 / 9
  return(temperature_celsius)
}

print(farenheit_to_celsius(-148))
print(farenheit_to_celsius(32))
print(farenheit_to_celsius(212))

# Verifique que aplicar una función seguida de la otra devuelven el valor original.

print(celsius_to_farenheit(farenheit_to_celsius(32)))
print(farenheit_to_celsius(celsius_to_farenheit(100)))
