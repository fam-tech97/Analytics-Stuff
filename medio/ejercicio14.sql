-- ============================================================
-- Reviews of Categories
-- ============================================================

-- PROBLEMA
--
-- Calcular el número de reseñas para cada categoría de negocio.
-- clasificados como "cool".
--
-- Utilicé una función llamada string_split que me permite separar en filas cada texto que esté separado por un carácter en particular.
-- En este caso, el caracter que separaba las categorías era ";".


-- ============================================================
-- SOLUCIÓN
-- ============================================================

select
value as category,
sum(review_count) as review_cnt
from yelp_business
cross apply string_split(categories, ';')
group by value
order by review_cnt desc


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- La empresa Yelp puede usar esta información para ver qué categorías de negocio pueden ser mas llamativas en base a la cantidad de reseñas.
--
-- Sin embargo, esas reseñas pueden ser mas negativas que positivas o viceversa. Entiendo que se hace esta pregunta para luego plantear
-- la duda de si ciertas categorías de negocios están recibiendo buenas o malas reseñas.


-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Cuantas reseñas negativas y positivas hay en cada categoría? Tendría sentido analizar primero las negativas ya que de esas son de las que mas se aprende por los errores.
--
-- 2. Hay mas métricas que se pueden sacar en base a este ejercicio. De las que tienen mas reseñas negativas, ¿cuantos negocios tienen 5 estrellas pero con reseñas negativas?
--   ¿En qué ciudades se localiza un comportamiento así?

-- 3. Hay una columna de is_open donde se podría ver cuantos negocios están abiertos y cual cerrados, porque puede ser que en todos esos números haya que filtrar por los que están abiertos.
--


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Utilizar la función string_split para poder separar una cadena de texto por un carácter en concreto.