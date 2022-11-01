library("rbenchmark")

check_all_true <- function(logical_vector) {
    return(sum(logical_vector) == length(logical_vector))
}

check_all_true_bucle <- function(logical_vector) {
    n_true <- 0

    for (i in seq_along(logical_vector)) {
        if (logical_vector[i]) {
            n_true <- n_true + 1
        }
    }
    return(n_true == length(logical_vector))
}

logical_vec <- c(TRUE, TRUE, TRUE)
logical_vec <- rep(logical_vec, 100000)


benchmark(
    all(logical_vec),
    check_all_true(logical_vec),
    check_all_true_bucle(logical_vec)
)
## No es mucha la diferencia con check_all_true,
# aunque la brecha aumentaría respecto a
# el check_all_true_bucle ya que se hace con bucles
