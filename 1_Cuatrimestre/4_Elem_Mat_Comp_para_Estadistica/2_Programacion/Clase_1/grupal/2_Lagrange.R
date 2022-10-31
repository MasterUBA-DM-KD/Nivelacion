
pol_lagrange <- function(x, xi, idx) {
    res <- function(x) {
        prod(sum(x, xi[xi != xi[idx]]) / sum(xi[idx], xi[xi != xi[idx]]))
    }
    return(res)
}

interpolador <- function(xi, yi) {
    for (idx in seq_along(yi)) {
        f <- yi[idx] * pol_lagrange(x, xi, yi)
    }
}

eval_pol_lagrange <- function(x, x_train, pol_lagrange) {

}
