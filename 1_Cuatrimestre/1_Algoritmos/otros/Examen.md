# Examen

## Ejercicio 1 (20 pts)
a) Escribir una función, usando el método iterativo, que dada una lista de números, devuelva la misma lista pero donde a los números impares se les sume +1. Por ejemplo, dado
[2,5,4,3] -> [2,6,4,4]

[3,3,3] -> [4,4,4]

[] -> []

[4] -> [4]

b) ¿Se puede hacer en forma recursiva esta función? En caso afirmativo, ¿qué cambiarías al algoritmo anterior para hacerla recursiva?

```python
def impar_mas_uno(lista_num):
  if len(lista_num) > 0:
    for i in range(len(lista_num)):
      if lista_num[i]%2 != 0:
        lista_num[i] = lista_num[i] + 1
  return lista_num
```

```python
assert impar_mas_uno([2,5,4,3]) == [2,6,4,4]
assert impar_mas_uno([3,3,3]) == [4,4,4]
assert impar_mas_uno([]) == []
assert impar_mas_uno([4]) == [4]
```

## Ejercicio 2 (15 pts)

Sea la siguiente función (ver imagen), cuya entrada es una lista de números.

```python
def func(lista):
  a, e = 0, 0
  i = 0
  while i < len(lista)-1:
    if lista[i] > lista[i+1]:
      a = a + 1
      i = i + 1
    elif lista[i] == lista[i+1]:
      e = e + 1
      i = i + 1
    else:
      i = i + 1
  return a + e + 1 == len(lista)
```

Describir en español cuál es el resultado de aplicar esta función sobre una lista (es decir, explicar qué características tienen las entradas para las cuales la función devuelve True y qué características tienen las entradas para las cuales la función devuelve False).

La función cuenta las veces en la que dos pares de elementos adyacentes decrecen y las veces en las que son iguales.

La función retorna True si la suma de ambos números (pares decrecientes, pares iguales) + 1 es igual a la longitud de la lista.
En otro caso, retorna cero.

Por ejemplo,
- Si todos elemenos en la lista siguen un orden decreciente se retornará True
```python
func([5,4,3,2,1]) -> True
func([-1,-2,-3,-4]) -> True
```
- Si todos los elementos son iguales retornará True
```python
func([-1,-1,-1,-1,-1]) -> True
```
- Si los elementos de la lista siguen un orden decreciente y luego se hace constante se retornará True
```python
func([5,4,3,3,3,3]) -> True
```
- Si los elementos siguen un orden creciente retornará False
```python
func([1,3,3,3]) -> False
```
- Si la lista está vacía retornará False
```python
func([]) -> False
```

## Ejercicio 3 (5 pts)

Seleccione las afirmaciones que son verdaderas acerca del algoritmo de Merge sort.
- Es una algoritmo de búsqueda
- Es un algoritmo de ordenamiento
- Utiliza recursión
- Divide el problema en muchos problemas más fáciles de resolver
- Siempre tiene mayor complejidad que Insertion Sort

## Ejercicio 4 (15 pts)
Dados los siguientes programas (ver imagen).

```python
def f1(lista):
  i = 0
  a, b = lista[i], lista[len(lista)-1]
  while i<len(lista):
    i = i +1
    a = a- lista[i-1]
  while 0 < i:
    i = i-1
    b = b -lista[i]
  print(a, b)
  return a ==b

def f2(lista):
  i = 0
  a, b = lista[i], lista[len(lista)-1]
  while i<len(lista):
    i = i +1
    a = a- lista[i-1]
  while 0 < i:
    i = i-1
    b = b -lista[i]
  print(a, b)
  return a ==b
```

a) Determinar qué computa cada función. Justificar brevemente.
- f1 chequea si la resta de los elementos excepto el primero y la resta de los elementos excepto el último es igual.
- f2 chequea si el primer elemento de la lista es distinto del último elemento de la lista.

b) Determinar para cada función cuál es el orden de complejidad algorítmica en el peor caso en función del tamaño de la lista L. Justificar brevemente. Ayuda: cada función se corresponde con alguno de los siguientes órdenes de complejidad, donde n = len(lista). O(1), O(n), O(log(n)), O(n), O(n ∗ log(n)), O(n^2), O(n^3), O(n!).

Sea n = len(lista)
- f1 tiene complejidad O(n) ya que en el peor de los casos se recorren dos veces los n elementos de la lista. La primera vez en el primer while de 0 a n-1. Por segunda vez en el segundo while de n-1 a 0
- f2 tiene complejidad O(n^2) ya que por cada elemento i de la lista recorre de nuevo los n elementos de la lista de j en j. Por lo tanto O(n*n) = O(n^2). Otra forma de verlo, es al notar que hay dos sentencias while anidadas.

## Ejercicio 6 (20 pts)

Implemente una función recursiva que reciba dos números positivos y enteros como parámetros (n y p) y  devuelva el resultado de ejecutar  la siguiente operación:

F(n, p) = (1 * p) + (2 * p) + (3 * p) +  … + ( n * p)

Por ej, si llamamos F(2, 2), debe devolver 6. Si llamamos F(3,2) debe devolver 12.

```python
def f_n_p(n,p):
    if n>0 and p>0:
        if n == 1:
            return n*p
        return n*p + f_n_p(n-1, p)

assert f_n_p(2,2) == 6
assert f_n_p(3,2) == 12
```

## Ejercicio 7 (15 pts)
Implementar una clase llamada Pava_electrica. La clase tiene como atributos: cantidad_liquido, temperatura, fabricante y linea. Además, tiene los métodos: __init__, cargar_liquido, vaciar_liquido y calentar_liquido.

```python
class Pava_electrica:
    def __init__(self, cantidad_liquido, temperatura, fabricante, linea):
        self.cantidad_liquido = cantidad_liquido
        self.temperatura = temperatura
        self.fabricante = fabricante
        self.linea = linea
    def cargar_liquido(self):
        print(f"La cantidad de líquido es: {self.cantidad_liquido}")
    def vaciar_liquido(self):
        print("La pava está vacía")
    def calentar_liquido(self):
        print(f"El agua está lista para el mate")

a = Pava_electrica(1, 40, "Noblex", "Premium")
a.cargar_liquido()
a.vaciar_liquido()
a.calentar_liquido()
```