# una funciòn que convierta una temperatura en grados Celsius a grados Fahrenheit

celsius_to_farenheit = function(temperature_celsius) {
  temperature_farenheit = temperature_celsius * 9/5  + 32
  return(temperature_farenheit)
}

print(celsius_to_farenheit(-100))
print(celsius_to_farenheit(0))
print(celsius_to_farenheit(100))


# otro programa que se haga la operación inversa (de Fahrenheit a Celsius)
farenheit_to_celsius = function(temperature_farenheit) {
  temperature_celsius = (temperature_farenheit - 32) * 5/9
  
  return(temperature_celsius)
}

print(farenheit_to_celsius(-148))
print(farenheit_to_celsius(32))
print(farenheit_to_celsius(212))

# verifique que aplicar una función seguida de la otra devuelven el valor original.
print(farenheit_to_celsius(celsius_to_farenheit(-100)))
print(farenheit_to_celsius(celsius_to_farenheit(0)))
print(farenheit_to_celsius(celsius_to_farenheit(100)))

# Cree una funciòn que dado un cuadrado, a partir de la variable base, calcule su perímetro y su área.


# Construya una función es_cuadrado_perfecto que devuelva un booleano según el input x es o no un cuadrado perfecto (existe k tal que k2)
# 
# Arme una función que dado un vector numérico x devuelve un vector con la media muestral y, la mediana. Use el siguiente modelo como base: