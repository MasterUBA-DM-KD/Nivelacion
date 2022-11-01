buscar_una_palabra <- function(palabra, lista_de_palabras) {
    si_esta_la_palabra <- palabra %in% lista_de_palabras
    return(si_esta_la_palabra)
}

test_buscar_una_palabra <- function() {
    t1 <- buscar_una_palabra("hola", list("hola", "chau")) == TRUE
    t2 <- buscar_una_palabra("alo", list("hola", "chau")) == FALSE

    pasa_los_test <- (t1 & t2)
    return(pasa_los_test)
}

borrar_duplicados <- function(lista_de_palabras) {
    unicos <- c()
    for (palabra in lista_de_palabras) {
        if (!buscar_una_palabra(palabra, unicos)) {
            unicos <- c(unicos, palabra)
        }
    }
    return(unicos)
}


####### Contar palabras


contar_palabras <- function(lista_de_palabras) {
    unicos <- unique(lista_de_palabras)
    aparece <- c()
    for (palabra in unicos) {
        aparece_p <- length(lista_de_palabras[lista_de_palabras == palabra])
        aparece <- c(aparece, aparece_p)
    }
    return(list(unicos = unicos, aparece = aparece))
}

######## Contar con frec_tipo
contar_palabras <- function(lista_de_palabras, frec_tipo = "relativa") {
    unicos <- borrar_duplicados(lista_de_palabras)
    aparece <- c()
    for (palabra in unicos) {
        aparece_p <- length(lista_de_palabras[lista_de_palabras == palabra])
        aparece <- c(aparece, aparece_p)
    }
    if (frec_tipo == "relativa") {
        return(list(unicos = unicos, aparece = aparece))
    } else {
        aparece <- aparece / sum(aparece)
        return(list(unicos = unicos, aparece = aparece))
    }
}


######## Plot
plot_frecuencias <- function(frecuencias, etiquetas, frec_tipo) {
    barplot(
        height = frecuencias, names.arg = etiquetas,
        main = str_interp("Frecuencia ${frec_tipo} de letras"),
        xlab = "Letra",
        ylab = str_interp("Frecuencia ${frec_tipo}")
    )
}


# install.packages("rbenchmark")
# install.packages("stringr)
library("rbenchmark")
library("stringr")

lista_test <- c("a", "b", "c", "c", "c", "d", "e", "f", "g", "g")
lista_test <- rep(lista_test, 1000)

test_buscar_una_palabra()

# Comparamos los tiempos
benchmark(borrar_duplicados(lista_test), unique(lista_test))
## significativamente más rápido usando la función unique()
benchmark(contar_palabras(lista_test), table(lista_test))
# Table toma significativamente menos tiempo


par(mfrow = c(1, 2))

frequency <- "relativa"
res <- contar_palabras(lista_test, frequency)
unicos <- res$unicos
freq <- res$aparece
plot_frecuencias(freq, unicos, frequency)

frequency <- "porcentual"
res <- contar_palabras(lista_test, frequency)
unicos <- res$unicos
freq <- res$aparece
plot_frecuencias(freq, unicos, frequency)


url <- "https://www.gutenberg.org/files/14765/14765-8.txt"
file <- readLines(url(url))
file_clean <- unlist(strsplit(str_replace_all(file, "([,.0-9])", ""), " "))
file_clean
all(unique(file_clean) == borrar_duplicados(file_clean))
# Compara elemento a elemento si iguales, devuelve TRUE si todos son iguales
