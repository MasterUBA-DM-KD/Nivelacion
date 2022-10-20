# Escriba una función que reciba los coeficientes del polinomio
# y devuelva un vector con las posibles raíces del polinomios.
# Use el siguiente modelo como base:

ceros_cuadratica <- function(a, b, c) {
  delta <- b^2 - 4 * a * c
  if (delta >= 0) {
    root_1 <- (-b - sqrt(delta)) / 2 * a
    root_2 <- (-b + sqrt(delta)) / 2 * a
    raices <- c(root_1, root_2)
  } else {
    raices <- "No roots"
  }
  return(raices)
}
# En lugar de ingresar los coeficientes por separado, repita el ejercicio
# pero ingrese un vector de coeficientes.
# Use el siguiente modelo como base:

ceros_cuadratica_vector <- function(coef_vector) {
  if (length(coef_vector) == 3) {
    a <- coef_vector[1]
    b <- coef_vector[2]
    c <- coef_vector[3]
    delta <- b^2 - 4 * a * c

    if (delta >= 0) {
      root_1 <- (-b - sqrt(delta)) / 2 * a
      root_2 <- (-b + sqrt(delta)) / 2 * a
      raices <- c(root_1, root_2)
    } else {
      raices <- "No roots"
    }
    return(raices)
  } else {
    return("Invalid input")
  }
}

# Escriba una función que reciba una función matemática y un valor
# y devuelva si dicho valor es raíz de la función.
# Use el siguiente modelo como base:

decidir_raiz <- function(fun, x) {
  es_raiz <- eval(parse(text = fun)) == 0
  return(es_raiz)
}

decidir_raiz("2*x^2", 0)

# Escriba una función que grafique una función junto con un valor dado.
# Que diga en el título del gráfico si es o no raíz de la función.
graficar_funcion_y_valor <- function(fun, valor) {
  x <- valor
  y_val <- eval(parse(text = fun))
  x_0 <- valor - 10
  x_n <- valor + 10

  x <- x_0:x_n
  y <- eval(parse(text = fun))

  plot(x, y, col = "red", type = "l", xlab = "x", ylab = "f(x)")
  points(valor, y_val, col = "blue")

  legend(1, 95, legend = c(fun, paste("(", valor, ",", y_val, ")", sep = "")), col = c("red", "blue"), lty = 1:2, cex = 0.8, border = "white")
}

graficar_funcion_y_valor("x^2", 0)
