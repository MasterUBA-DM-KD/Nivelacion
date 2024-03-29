# Clase 5 - 29/10 <!-- omit in toc -->
## Table of Contents <!-- omit in toc -->
- [Grupal](#grupal)
  - [Dataframes](#dataframes)
## Grupal
### Dataframes
Considere el dataset Bikeshare del paquete [ISLR2](https://cran.rstudio.com/web/packages/ISLR2/index.html):
```r
# install.packages("ISLR2")
library(ISLR2)
Bikeshare
```
1. Qué datos recoge el dataframe? (`help(Bikeshare)` o `?Bikeshare`)
2. Explore el dataframe con los comandos `summary`, `head` y `tail`.
3. ¿Qué dimensiones tiene? (`dim`, `nrow`, `ncol`)
4. ¿Cómo se llaman las columnas? ¿Y las filas? (`colnames`, `rownames`)
5. ¿Qué tipo de dato representa cada variable?
6. ¿Hay valores faltantes? Es decir, ¿hay valores `NA` ? (`is.na`)
7. Escriba una función que transforme una columna numérica en una con solo dos categorías, “bajo” y “alto” según los valores sean menores que un umbral predeterminado. Use el siguiente modelo como ejemplo:
    ```r
    transformar_columna(dataframe, nombre_columna, umbral){
        #…
        return(dataframe)
    }
    ```
8. ¿Cuál es el promedio de bikers por `season`?
9. Grafique el comando `boxplot(bikers ~ weekday, data=Bikeshare)`.
10. Utilice el comando `read.table` o `read.csv` para:
    - Leer el archivo desde el siguiente [link](https://github.com/anevolbap/modulo-nivelador-programacion/blob/master/bikeshare.csv) (vea el argumento `url`)
    - Leer el archivo desde el disco (descargue el archivo del dataset primero)
11. Escriba una función que reemplace la variable `season` un **one-hot-encoding**. Es decir, reemplace la columna `season` por tantas columnas como categorías admita, donde cada columna indica, con `1` o `0`, según su valor. Por ejemplo, si la observación es `season = 3`, las nuevas columnas valdrían `season_1 = 0`, `season_2 = 0`, `season_3 = 1`, `season_4 = 0`.
12. Escriba una función que reemplace la variable `mnth` con una variable numérica que tenga el promedio de registered por cada categoría.