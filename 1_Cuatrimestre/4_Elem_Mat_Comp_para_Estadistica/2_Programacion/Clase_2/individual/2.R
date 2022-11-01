extraer_trisup <- function(matriz) {
    trisup <- matriz
    trisup[lower.tri(trisup, diag = TRUE)] <- 0

    return(trisup)
}


matriz <- matrix(1:9, 5, 5)
extraer_trisup(matriz)
