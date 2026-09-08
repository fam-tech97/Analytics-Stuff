-- ============================================================
-- Top Businesses With Most Reviews
-- ============================================================

-- PROBLEMA
--
-- Encontrar el top 5 de negocios con más reseñas.
-- Para aquellos negocios que estén empatados en número de reseñas,
-- reciben el mismo número de ranking y el siguiente ranking se salta
-- tantos puestos como negocios haya en el empate.
--
-- Ejemplo:
-- Negocio A -> 1
-- Negocio B -> 2
-- Negocio C -> 2
-- Negocio D -> 4
--
-- Teniendo en cuenta la condición que propone el ejercicio,
-- he utilizado la función de ventana RANK().
-- RANK() asigna el mismo ranking a los valores empatados
-- y deja huecos en la numeración posterior.


-- ============================================================
-- SOLUCIÓN
-- ============================================================

WITH business_rank AS (
    SELECT
        name,
        review_count,
        RANK() OVER(ORDER BY review_count DESC) AS ranking
    FROM yelp_business
)

SELECT
    name,
    review_count
FROM business_rank
WHERE ranking <= 5;


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- Yelp quiere identificar los negocios que generan un mayor volumen
-- de reseñas dentro de la plataforma.
--
-- Tener muchas reseñas puede indicar un alto volumen de interacción,
-- pero no necesariamente significa que el negocio tenga una buena
-- reputación o que tenga un mayor impacto.
--
-- Las reseñas pueden ser tanto positivas como negativas, por lo que
-- este análisis únicamente nos muestra el volumen y no la calidad
-- de la experiencia de los clientes.
--
-- Una vez identificados estos negocios, Yelp podría analizar qué
-- características tienen, qué tipo de reseñas reciben y qué factores
-- pueden explicar que generen un volumen tan elevado de interacción.


-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Por qué Yelp quiere identificar los negocios con mayor número
--    de reseñas?
--
--    Podría utilizar esta información para estudiar los negocios
--    con mayor volumen de interacción y posteriormente analizar
--    qué características tienen en común.


-- 2. ¿Qué tipo de reseñas reciben estos negocios?
--
--    Analizar el porcentaje de reseñas positivas y negativas para
--    comprobar si los negocios con mayor volumen de reseñas tienen
--    también una buena valoración.


-- 3. ¿Qué porcentaje de las reseñas de cada negocio son negativas?
--
--    Es más útil analizar el porcentaje que únicamente el número
--    absoluto, ya que los negocios tienen diferentes cantidades
--    totales de reseñas.


-- 4. ¿Qué valoración media tienen estos negocios?
--
--    De esta forma podemos diferenciar entre negocios con muchas
--    reseñas y negocios con buena reputación.


-- 5. ¿Qué porcentaje de todas las reseñas de Yelp concentran estos
--    cinco negocios?
--
--    Esto permitiría analizar si existe una alta concentración de
--    reseñas en un pequeño grupo de negocios.


-- 6. ¿Qué características tienen en común los negocios que reciben
--    un mayor volumen de reseñas?
--
--    Por ejemplo: categoría, ciudad, número de años en la plataforma,
--    valoración media, etc.


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Utilizar la función de ventana RANK().
-- * RANK() asigna el mismo ranking a los valores empatados y deja
--   huecos en la numeración posterior.
-- * Utilizar una CTE para calcular primero el ranking y posteriormente
--   filtrar los resultados.
-- * Un número elevado de reseñas representa volumen de interacción,
--   pero no necesariamente una buena reputación.
-- * Al comparar negocios con diferente número de reseñas, puede ser
--   necesario utilizar porcentajes en lugar de valores absolutos.
