-- ============================================================
-- Average Total Compensation by Employee Title and Gender
-- ============================================================

## -- PROBLEMA

-- Encontrar la compensación total media de los empleados
-- agrupada por título y género.
--------------------------------

-- La compensación total se calcula como:
-- Salary + Bonus
-----------------

-- Solo se consideran empleados que han recibido al menos un bonus.
-- Como un empleado puede recibir varios bonus, primero se suman
-- todos sus bonus antes de calcular la compensación total.

-- ============================================================
-- SOLUCIÓN
-- ============================================================

WITH full_bonus AS (
SELECT
worker_ref_id,
SUM(bonus) AS total_bonus
FROM sf_bonus
GROUP BY worker_ref_id
)

SELECT
E.employee_title,
E.sex AS gender,
AVG(E.salary + FB.total_bonus) AS compensation
FROM sf_employee E
INNER JOIN full_bonus FB
ON FB.worker_ref_id = E.id
GROUP BY
E.employee_title,
E.sex;

-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- La métrica permite comparar la compensación media entre hombres
-- y mujeres dentro de un mismo puesto.
---------------------------------------

-- Un posible objetivo de negocio sería analizar si existen
-- diferencias de compensación según el género y detectar posibles
-- diferencias salariales que requieran una investigación más profunda.
-----------------------------------------------------------------------

-- Es importante analizar por título y no únicamente comparar la
-- compensación media de hombres y mujeres en toda la empresa, ya que
-- la distribución de empleados entre puestos puede ser diferente.
------------------------------------------------------------------

-- Además, al incluir los bonus en la compensación total, podemos
-- detectar diferencias que no necesariamente aparecen al analizar
-- únicamente el salario base.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Existen diferencias de compensación entre hombres y mujeres
--    dentro del mismo puesto?
------------------------------

## -- 2. ¿Las diferencias proceden del salario base, del bonus o de ambos?

## -- 3. ¿Qué puestos presentan las mayores diferencias?

## -- 4. ¿Qué porcentaje de empleados recibe bonus?

-- 5. ¿Existe alguna diferencia entre géneros en la probabilidad
--    o cantidad de bonus recibido?
-----------------------------------

-- 6. ¿Qué ocurre si incluimos también a los empleados que no reciben
--    bonus?
------------

-- 7. ¿Las diferencias podrían explicarse por antigüedad, seniority,
--    experiencia o ubicación?

-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Un empleado puede tener múltiples registros de bonus, por lo que
--   primero hay que agregarlos por empleado.
---------------------------------------------

-- * INNER JOIN permite quedarnos únicamente con empleados que tienen
--   al menos un bonus.
-----------------------

-- * La unidad final de análisis es el grupo formado por:
--   employee_title + gender.
-----------------------------

-- * Una diferencia entre dos métricas no implica necesariamente que
--   exista una causa; primero hay que investigar qué factores pueden
--   explicarla.
----------------

-- * Una métrica puede servir para detectar un posible problema, pero
--   no necesariamente explica por qué ocurre.
