-- ============================================================
-- Top Cool Votes
-- ============================================================

-- PROBLEMA
--
-- Encontrar las reseñas que tienen el mayor número de votos
-- clasificados como "cool".
--
-- Utilicé una subquery para obtener el valor máximo de la columna
-- "cool" y posteriormente filtrar las reseñas que tienen ese valor.
--
-- Una ventaja de este enfoque es que devuelve todas las reseñas
-- que estén empatadas con el máximo.


-- ============================================================
-- SOLUCIÓN
-- ============================================================

SELECT
    business_name,
    review_text
FROM yelp_reviews
WHERE cool = (SELECT MAX(cool) FROM yelp_reviews);


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- Yelp puede utilizar esta información para identificar las reseñas
-- que generan mayor reconocimiento o interacción por parte de los
-- usuarios.
--
-- Sin embargo, un número elevado de votos "cool" no significa
-- necesariamente que la reseña sea positiva. Por tanto, esta métrica
-- no debería interpretarse directamente como una medida de reputación.
--
-- Puede ser interesante estudiar qué características tienen las
-- reseñas que generan mayor engagement.


-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Qué diferencia existe entre las reseñas que reciben muchos
--    votos "cool" y las que reciben muchos votos "useful"?
--
-- 2. ¿Existe relación entre la valoración en estrellas y el número
--    de votos "cool"?
--
-- 3. ¿Las reseñas negativas pueden generar más engagement que las
--    positivas?
--
-- 4. ¿Qué negocios tienen un mayor número de reseñas con muchos
--    votos "cool"?
--
-- 5. ¿Qué características tienen las reseñas que generan mayor
--    interacción?


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Utilizar una subquery para obtener el valor máximo de una columna.
--
-- * Utilizar el resultado de una subquery dentro de un WHERE.
--
-- * Un mismo valor máximo puede pertenecer a varias filas, por lo que
--   este enfoque permite devolver todos los registros empatados.
--
-- * Una métrica no siempre explica por sí sola el fenómeno de negocio.
--   Es necesario interpretar qué significa realmente el indicador
--   antes de sacar conclusiones.