library(rbenchmark)

swap_sort <- function(vec_to_sort) {
    temp <- 0
    for (i in seq_along(vec_to_sort)) {
        for (j in seq_along(vec_to_sort)) {
            a <- vec_to_sort[i]
            b <- vec_to_sort[j]
            if (a < b) {
                vec_to_sort[i] <- b
                vec_to_sort[j] <- a
            }
        }
    }
    return(vec_to_sort)
}


messy_vect <- c(1, 2, -100, 5, 9, -1)
ordered_vector <- swap_sort(messy_vect)
print(ordered_vector)
# Funciona!


messy_vect <- rep(messy_vect, 100)

benchmark(
    swap_sort(messy_vect),
    sort(messy_vect)
)

# Sort toma mucho menos tiempo que swap_sort
