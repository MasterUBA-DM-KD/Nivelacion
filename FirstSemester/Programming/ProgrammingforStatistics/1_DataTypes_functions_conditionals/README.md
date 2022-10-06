# Clase 1 - Ejercicios <!--omit in toc-->
## Table of Contents <!--omit in toc-->
- [Clase 1 - Ejercicios](#clase-1---ejercicios)
  - [Table of Contents](#table-of-contents)
  - [Individuales](#individuales)
  - [Grupales](#grupales)
    - [Ceros de la función cuadrática](#ceros-de-la-función-cuadrática)
    - [Polinómio de Lagrange](#polinómio-de-lagrange)
    - [Método de bisección](#método-de-bisección)
## Individuales
1. Escriba:
   1. Una función que convierta una temperatura en grados Celsius a grados `Fahrenheit`.
   2. Otro programa que se haga la operación inversa (de Fahrenheit a Celsius).
   3. Verifique que aplicar una función seguida de la otra devuelven el valor original.
2. Cree una función que dado un cuadrado, a partir de la variable `base`, calcule su `perímetro` y su `área`.

3. Construya una función `es_cuadrado_perfecto` que devuelva un **boolean** según el input `x` es o no un cuadrado perfecto (existe `k` tal que `k²`)

4. Arme una función que dado un vector numérico `x` devuelve un vector con la `media muestral y`, la `mediana`. Use el siguiente modelo como base:

    ```r
    medias = function(x) {
        return(c(mean(x), median(x)))
    }
    ```

    Una vez definida la función `medias` ejecute la siguente línea:

    ```r
    replicaciones = replicate(10000, medias(rnorm(100)))
    ```

    Extraiga de la matriz `replicaciones` las `medias` y `medianas`, y asígnelas a los vectores `las_medias` y `las_medianas` respectivamente. Luego ejecute el siguiente código para graficar.

    ```r
    colores = c("skyblue3", "orange")
    densidades = c(50, 30)
    # las_medias = ...
    hist(las_medias, density=densidades[1], col = colores[1])
    # las_mediana = ...
    hist(las_medianas, density=densidades[2], col = colores[2], add=TRUE)
    legend("topright", legend=c("media", "mediana"), col = colores, density=densidades, fill = colores)
    ```
5. Una empresa regala una heladera al azar entre `N` personas. Repite el proceso `n` veces. ¿Cuál es la probabilidad de que una persona reciba dos heladeras?
   1. Primero escriba una función que simule una sola realización del sorteo. Usá el siguiente modelo:
   ```r
   una_heladera = function(N, n){
        # ...
        return(dos_heladeras_bool)
    }
   ```
    2. Use el siguiente código para obtener un vector con los resultados de correr la función anterior `k` veces.
    ```r
    k = 1000
    N = 40000000
    n = 15000
    reps = replicate(k, una_heladera(N, n))
    ```
    3. Calcule la media muestral de `reps`, ¿qué representa?.
6. Considere la siguientes tres sucesiones:
   - $$a_n = (\dfrac{1}{\sqrt{n}}) + (\dfrac{1}{n})^n$$
   - $$b_n = (-1)^n + 5$$
   - $$c_n = \dfrac{3n-8}{\sqrt{16n^2 + n}}$$
   1. Grafique los primeros `n=100` términos de cada sucesión.
   2. Decida si las sucesiones son convergentes y en tal caso agregue una línea horizontal al gráfico.
7. Considere las siguientes funciones:
    $$
    f(x)=
    \begin{cases}
    l_1(x) = |x|\\
    l_2(x) = x^2\\
    \rho_x = x^2 • I_{(|x|≤k)} + 2k|x| - k^2 • I_{(|x|>k)}\\
    \end{cases}
    \forall \; xE[−10,10]
    $$

  Grafique $\rho_k$ con `k=5` junto a las otras funciones con distintos colores y una leyenda.
8. Grafique el polinomio interpolador de `Lagranges` en `n+1` puntos equiespaciados en el intervalo `[−1,1]`, con `n=5,10,15`, para los valores generados por las siguientes funciones:
   - $$f_1(x) = \dfrac{1}{25x^2}$$
   - $$f_2(x) = sin(\pi x)$$

## Grupales
### Ceros de la función cuadrática
Dado el polinomio de grado 2, $p(x)=ax^2+bx+c$, decimos que $x_0$ es un cero o raíz del polinomio si $p(x_0)=0$. Tenga presente que según el valor de $\Delta = b^2 − 4ac$ el polinomio podría tener una raíz múltiple o incluse no tener raíces.
1. Escriba una función que reciba los coeficientes del polinomio y devuelva un vector con las posibles raíces del polinomios. Use el siguiente modelo como base:
    ```r
    ceros_cuadratica = function(a, b, c){
        # raices = ...
        return(raices)
    }
    ```
2. En lugar de ingresar los coeficientes por separado, repita el ejercicio pero ingrese un vector de coeficientes. Use el siguiente modelo como base:
   ```r
   ceros_cuadratica = function(a, b, c){
        # raices = ...
        return(raices)
    }
   ```
3. Escriba una función que reciba una función matemática y un valor y devuelva si dicho valor es raíz de la función. Use el siguiente modelo como base:
   ```r
   decidir_raiz = function(fun, valor){
        # es_raiz = ...
        return(es_raiz)
    }
   ```
4. Escriba una función que grafique una función junto con un valor dado. Que diga en el título del gráfico si es o no raíz de la función.
   ```r
   graficar_funcion_y_valor = function(fun, valor){
        # ...
    }
   ```

### Polinómio de Lagrange
El objetivo de la actividad es implementar el [polinomio interpolador de Lagrange](https://es.wikipedia.org/wiki/Interpolaci%C3%B3n_polin%C3%B3mica_de_Lagrange#:~:text=En%20an%C3%A1lisis%20num%C3%A9rico%2C%20el%20polinomio,por%20Leonhard%20Euler%20en%201783.).


Dados `n` pares de puntos $(x_1,y_1), ...,(x_n,y_n)$, el polinomio interpolador de Lagrange, es decir el único polinomio $f(x)$ de grado `k+1` tal que $f(x_i) = y_i$ para todo $i = 1...,n$. Su expresión viene dada por:
$$f(x) = y_1⋅p_1(x) +...+ y_n⋅p_n(x)$$
donde cada $p_n$ es el `j-ésimo` polinomio de Lagrange:

$$p_j(x) = \prod_{i \neq 1}^{} \dfrac{x - x_i}{x_i - x_j}$$

1. Escriba una función que calcule el j-ésimo polinomio de Lagrange pj(x). Debe recibir:
   - el punto $x$ donde será evaluado,
   - un vector $x_i$ con las abscisas de los puntos a interpolar,
   - el índice $idx$ del polinomio de Lagrange buscado.
    Y debe devolver:
   - el valor del polinomio evaluado pj(x). Use el siguiente modelo como base
   ```r
   pol_lagrange function(x xi, idx){
        # res = p_idx(j)...
        return(res)
    }
   ```
    > **Funciones útiles:** `sum`, `prod`.

2. Escriba una función que reciba un vectores $x_i$ e $y_i$ con las coordenadas de los puntos a interpolar y devuelva, como función, al correspondiente polinomio interpolador de Lagrange. Use el siguiente modelo como base:
   ```r
   interpolador = function(xi, yi) {
        # f = function(x) ...
        return(f)
    }
   ```
    > **Funciones útiles:** `length`, `source`.
    > **Sugerencia:** use la función `eval_pol_lagrange()` del archivo `helpers_clase1.R`.
    ```r
    eval_pol_lagrange = function(x, x_train, pol_lagrange) {
        # Evalua todos los polinomios de Lagrange calculados para x_train usando los
        # polinomios generados por build_plot_lagrange()
        #
        # Input
        #
        # x: punto donde quiero evaluar.
        # x_train: vector de xs a interpolar.
        # build_plot_lagrange: función que genera el j-ésimo polinomio
        #                      de Lagrange calcularo para x_train (como función).
        #
        # Output
        #
        # res: vector de las evaluaciones en x de los polinomios de Lagrange.
        res = c()
        for (iter in 1:length(x_train)) {
            pol = pol_lagrange(x, x_train, iter)
            res = c(res, pol)
        }
        return(res)
    }
    ```
3. Escriba una función que reciba xi, yi y grafique su polinomio interpolador. Cambie los colores, agrege un título y etiquetas a los ejes.
   > **Funciones útiles:** `plot`, `seq`.
   ```r
   graficar_interpolador = function(xi, yi) {
        # Datos los puntos (xi, yi), grafica su polinomio interpolador de Lagrange.
        # Defino una grilla de valores para graficar
        xs = seq(min(x_train), max(x_train), length = 1e2)
        # Calculo el valor del polinomio en la grilla
        ys = Map(interpolador(x_train, y_train), xs)
        # Grafico
        # plot(...)
    }
   ```
### Método de bisección
Dada una función continua `f` definida en un intervalo `[a,b]`, si `f(a)∗f(b)<0` entonces existe $x_0$ tal que $f(x_0)=0$. El método de bisección repite el siguiente pasos:
   - Elijo un punto del intervalo para crear dos subintervalos.
   - Descarto el intervalo en cuyos extremos `f` toma valores con distinto signo.
   - Si el intervalo resultante tiene ancho menor a una tolerancia, declaramos que cualquiera de los extremos es raíz de `f`.

1. Escriba una función que haga un paso de bisección. Debe recibir función `fun` cuya raíz buscamos, un vector `intervalo` cuyas coordenadas sean los extremos del intervalo inicial y una tolerancia `tol` para declarar que una raíz fue encontrada. Use el siguiente modelo como base:
   ```r
   biseccion_un_paso = function(fun, intervalo, tol = 1e-4){
        # Punto medio del intervalo
        medio = ...
        # Evaluo la función en los tres puntos
        f_medio = ...
        f_izq = ...
        f_der = ...
        z Defino el siguiente intervalo
        intervalo_nuevo = ...
        # Chequeo la tolerancia
        flag = ...
        # Devuelvo el
        return(list(fun = fun,
                    intervalo = intervalo_nuevo,
                    flag = flag))
    }
   ```
2. Utilice la función `iterar_funcion()` para aplicar la función `biseccion_un_paso()`.
   ```r
   iterar_funcion = function(fun_iterar, fun, intervalo_inicial, tol=1e-4) {
        intervalo = intervalo_inicial
        salida = FALSE
        while (!salida) {
            res = fun_iterar(fun, intervalo, tol)
            intervalo = res$intervalo
            salida = res$flag
        }
        return(res)
    }
   ```
3. Una forma de evitar la implementación de un bucle es la *recursión*.
   ```r
   biseccion_recursiva = function(fun, intervalo, tol = 1e-4){
        ## ... código de la función anterior....
        ## Llamo a la misma función!
        if (!flag) {
            ret = biseccion_recursiva(fun, intervalo_nuevo)
        }
        # Cuando termina devuelvo el último resultado
        return(ret)
    }
   ```
4. Modifique la función `iterar_funcion()` para registrar todas las iteraciones del método para hacer un gráfico de la trayectoria.
   ```r
   iterar_funcion_track = function(fun_iterar, fun, intervalo_inicial, tol=1e-4) {
        intervalo = intervalo_inicial
        salida = FALSE
        trace = c()
        while (!salida) {
            res = fun_iterar(fun, intervalo, tol)
            intervalo = res$intervalo
            salida = res$flag
            trace = c(trace, mean(intervalo))
        }
        return(trace)
    }
   ```