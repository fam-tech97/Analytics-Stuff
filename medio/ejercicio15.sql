-- ============================================================
-- Top Businesses With Most Reviews
-- ============================================================

-- PROBLEMA
--
-- Encontrar el top 5 de negocios con mas reseñas. 
-- Para aquellos negocios que estén en empate en reseñas, reciben el mismo número de ranking.
-- Una vez haya un empate en el ranking de dos negocios, se saltará al siguiente número.
-- Por ejemplo si hay 2 negocios que tienen el puesto 2, el siguiente será el número 4.
--
-- Teniendo en cuenta la condición que propone el ejercicio, he usado la función de ventana rank().
-- Gracias a esto, aquellos que hayan empatado, el siguiente negocio tendrá el siguiente número, tal y como pide el ejercicio.


-- ============================================================
-- SOLUCIÓN
-- ============================================================

with business_rank as (
    select
        name,
        review_count,
        rank() over(order by review_count desc) as ranking
    from yelp_business
)

select name, review_count from business_rank where ranking <= 5


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- La compañía de Yelp quiere encontrar aquellos negocios que tengan más reseñas.
-- Sin embargo en este ejercicio solo quieren un top 5, estas reseñas pueden ser tanto positivas como negativas.
-- Es posible que quieran examinar bien los negocios con mas reseñas, viendo qué pueden analizar y sacar de ahí.
-- Hay que tener en cuenta que, aunque un negocio tenga muchas reseñas, puede darse el caso de que en su totalidad sean negativas.

-- Una vez identificadas aquellos negocios con mas reseñas, se querrá investigar en qué se puede mejorar.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Por qué la empresa quiere saber cuales son los top 5 negocios en base a las reseñas? Seguramente porque quieren ver aquellos negocios que tienen más impacto o visibilidad.

-- 2. ¿Se hará un análisis de qué tipo de reseñas tienen esos negocios con mayor número de reseñas? Como había comentado, puede haber mas reseñas negativas que positivas, de las cuales se puede aprender.

-- 3. ¿Cual será la media de reseñas positivas y negativas de estos 5 negocios?

-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Usar la función de ventana rank() que es la que hace un salto entre 2 sujetos que tengan el mismo ranking.