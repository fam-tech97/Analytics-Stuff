-- ============================================================
-- Employees With the Same Salary
-- ============================================================

-- PROBLEMA
--
-- Se pide encontrar a los empleados que cobren el mismo salario.
--
-- Teniendo en cuenta que solo tenemos una tabla llamada worker, he decidido realizar un self-join
-- de la tabla donde hago la union por el mismo salario pero que el id del empleado sea distinto.

-- ============================================================
-- SOLUCIÓN
-- ============================================================

select distinct
w1.worker_id as worker_id,
w1.first_name as first_name,
w1.salary as salary
from worker w1
inner join worker w2 on w1.salary = w2.salary and w1.worker_id <> w2.worker_id
order by w1.salary desc

-- ¿Qué produce exactamente mi consulta?
--
-- Esta consulta permite mostrar una distribución de los empleados que cobran el mismo salario.
-- Sin embargo, no sabemos a qué departamentos pertenece cada uno por lo que el salario podría ser diferente
-- en cada departamento.
--	
-- ¿Qué NO puedo saber con ese resultado?
--
-- Los departamentos de los empleados que cobran el mismo salario.
-- Antiguedad de los empleados


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- Esta consulta permite mostrar una distribución de los empleados que cobran el mismo salario.
-- Sin embargo, no sabemos a qué departamentos pertenece cada uno por lo que el salario podría ser diferente
-- en cada departamento.
--
-- OTRA OPCIÓN
-- La consulta permite identificar grupos de empleados que comparten salario. 
-- Este resultado puede utilizarse como punto de partida para analizar la estructura salarial y comprobar 
-- si las personas con salarios iguales comparten características similares como departamento, puesto, antigüedad o responsabilidades.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿A qué departamento pertenece cada empleado?
--
-- 2. ¿Qué antiguedad tienen los empleados que comparten salario?
--
-- 3. ¿El salario compartido es el máximo dentro de su departamento?
--
-- 4. ¿Tienen las mismas responsabilidades?
--
-- 5. ¿Cuántos empleados comparten cada salario?



-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Hacer self-join debido a que solo tengo una tabla con X condiciones para obtener el resultado deseado.
-- * Una lista de empleados que cobran lo mismo me permite identificar una situación que merezca un análisis más profundo
--   ya que, sin saber el departamento o puesto, no puedo saber bien por qué cobran el mismo sueldo.