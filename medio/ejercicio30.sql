-- ============================================================
-- AI Feature Adoption Funnel
-- ============================================================

-- PROBLEMA
--
-- Se solicita mostrar un conteo por cada fase por el que pasa una función de escritura con IA. 
-- Esta tiene 3 fases, impression (vio la función), first_use (lo ha usado al menos una vez) y repeat_use (lo ha usado mas de una vez.)
-- Hay que tener en cuenta que, por una falta de tracking, algunos usuarios tienen evento de repeat_use pero no un evento de first_use por lo que debe contar como first_use.
--
-- Teniendo en cuenta lo que pide el ejercicio, he decidido usar el union all con 3 consultas. 
-- Una para impression, una para repeat_use y la otra para first_use. Esta ultima contiene first_use y repeat_use por la condición que nos plantea el ejercicio.

-- ============================================================
-- SOLUCIÓN
-- ============================================================

select 'first_use' as funnel_stage, 
count(distinct user_id) as unique_users
from ai_funnel_events where event_type in ('first_use','repeat_use')
union all
select 'impression' as funnel_stage, 
count(distinct user_id) as unique_users
from ai_funnel_events where event_type = 'impression'
union all
select 'repeat_use' as funnel_stage, 
count(distinct user_id) as unique_users
from ai_funnel_events where event_type = 'repeat_use'

-- ¿Qué información produce esta consulta?
--
-- Genera una lista de usuarios únicos que han pasado por las fases
-- establecidas de una función de escritura con IA.
--
-- ¿Qué me falta para interpretar mejor el resultado?
-- 
-- A qué departamento pertenecen los usuarios que han usado esta función, por ejemplo.

-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- El equipo de Data Science y Analytics quiere saber cuantas personas han pasado
-- por los distintos estados sobre una función de escritura de IA. Sin embargo, 
-- no tenemos información de esos empleados.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿A qué departamento pertenece cada persona de cada fase?
--
-- 2. Respecto a los que han visto la función (usando el estado impression), ¿cuántas personas les han dado uso?
-- Puede ser que hayan personas que hayan visto la función y no la hayan usado.


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * UNION ALL permite combinar resultados manteniendo los duplicados.
-- * Cuando me encuentre con un caso de que hay que sustituir un valor por otro, optar por usar UNION ALL con varias consultas y filtros distintos.