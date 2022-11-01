indicar_deciles <- function(num_vec) {
    deciles <- quantile(num_vec, probs = seq(0.1, 0.9, by = .1))
    deciles_vec <- c()
    deciles_vec_str <- c()

    for (i in seq_along(num_vec)) {
        if (i <= deciles[[1]]) {
            decil <- 1
        } else if (i > deciles[[length(deciles)]]) {
            decil <- 10
        } else {
            for (j in 1:(length(deciles) - 1)) {
                if (i > deciles[[j]] && i <= deciles[[j + 1]]) {
                    decil <- j + 1
                }
            }
        }
        deciles_vec <- c(deciles_vec, decil)
    }

    for (i in seq_along(deciles_vec)) {
        decil_str <- switch(deciles_vec[i],
            "primer decil",
            "segundo decil",
            "tercer decil",
            "cuarto decil",
            "quinto decil",
            "sexto decil",
            "séptimo decil",
            "octavo decil",
            "noveno decil",
            "décimo decil"
        )
        deciles_vec_str[i] <- decil_str
    }


    return(deciles_vec_str)
}

x <- 1:10
deciles <- indicar_deciles(x)

print(deciles)
