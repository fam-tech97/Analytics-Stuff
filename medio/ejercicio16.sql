-- ============================================================
-- Find all possible varieties which occur in either of the winemag datasets
-- ============================================================

-- PROBLEMA
--
-- Encontrar todas las variedades o tipos de vino que hay entre 2 datasets. 
-- Hay que aportar los valores únicos de la variedades de vino.
-- 
-- En la tabla 1 hay X variedades y en la tabla 2 hay Y variedades.
--
-- Teniendo en cuenta lo que pide el ejercicio, la idea aquí es unir ambas tablas con un UNION.
-- Esto hace que se unan las dos tablas, siempre que ambas tengan las mismas filas, quitando los duplicados que hayan entre las dos.


-- ============================================================
-- SOLUCIÓN
-- ============================================================

select variety from winemag_p1
union
select variety from winemag_p2
order by variety asc


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- Wine Magazine quiere saber cuáles son aquellos tipos de vino que tiene en total.
-- Imagino que quieren ver cuantos tipos de vino tienen para luego hacer un análisis más en profundidad ya que esta lista lo unico que aporta es todos los vinos que tienen.
-- 
-- Al tener muchos tipos de vino, puede ser que vean que no hace falta tantos tipos, pero esto dependerá de si un tipo de vino es bueno o malo.
--
-- Realmente con el número de tipos de vino simplemente podemos ver cuantos hay pero aquí hay mas variables que deberían de tenerse en cuenta.
-- Tenemos dato de países, región, puntos, precio. Podemos hacer clasificaciones de los vinos en base a estos parámetros.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Qué país es el que tiene mas tipos de vino?
--
--    Esta información podría ser utilizada para saber qué países tienen mayor número de tipos de vino.


-- 2. ¿Qué tipos de vino son los que mejor valoración tienen?
--
--    Cuando analizamos esto junto a los países, podríamos ver cuáles son los que tienen mayor impacto.


-- 3. Aquellos vinos que tengan una valoración baja, ¿a qué se puede deber?
--
--    Tenemos una columna de puntos, lo cual nos viene bien, pero no podemos sacar la causa de por qué tienen esos puntos. 
--	  Puede ser porque es un vino muy caro, hay una descripción del vino pero viene de parte de comercial, no de los clientes.
--	  Si hubiera una tabla con las reseñas por cada tipo de vino, tendríamos un análisis más claro.

-- 4. ¿Qué puntuación media hay por cada tipo de vino?
--
--    Con este dato podemos identificar aquellos que, de media, tengan una buena puntuación.


-- 5. ¿Los vinos que son caros tienen mejor o peor valoración?
--
--    Puede ser que los vinos más caros tengan malas valoraciones.


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Utilizar UNION para juntar 2 tablas, teniendo en cuenta que ambas tablas tienen que tener el mismo numero de columnas para que funcione.
-- * A diferencia de UNION ALL, UNION hace lo que he indicado pero esta vez elimina los valores repetidos.
