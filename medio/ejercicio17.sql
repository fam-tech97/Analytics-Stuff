-- ============================================================
-- Highest Target Under Manager
-- ============================================================

-- PROBLEMA
--
-- Hay que encontrar aquellos empleados que hayan conseguido el target máximo de todos los empleados que trabajan para el manager con id igual a 13.
--
-- Teniendo en cuenta lo que pide el ejercicio, con que encuentre primero el target maximo y filtre por el id del manager podré usarlo como filtro para los empleados que trabajan para el manager
-- cuyo id es el 13.


-- ============================================================
-- SOLUCIÓN
-- ============================================================

select 
first_name,
target
from salesforce_employees
where target = (
        select
            max(target) as max_target
        from salesforce_employees
        where manager_id = 13
    ) and manager_id = 13


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- Salesforce quiere saber cuales son aquellos empleados que tienen el maximo target bajo el manager número 13.
-- En esta tabla se dispone de un salario, target y bonus. Realmente me da la curiosidad de qué significa ese target.
-- 
-- Puede ser que el manager numero 13 tenga una alta reputación en la empresa o que los empleados que hayan llegado a un target en particular pues se les querrá subir el sueldo o algo así.
--
-- Sería interesante ver a qué departamento corresponde cada empleado del manager 13 y cuales son sus puestos de trabajo.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Por qué se quiere identificar a los empleados con mayor target dentro de este manager?

-- 2. ¿A qué departamento corresponde el manager número 13?
--
--    Sabiendo esto se puede hacer un análisis de los empleados cuyo departamento es llevado por el manager número 13.


-- 3. ¿Existe relación entre target, salario y bonus?
--
--    Puede que los empleados con mayor target tengan mejor salario, que el bonus esté relacionado con el cumplimiento del target, etc.

-- 4. ¿El empleado con mayor target también es el que tiene mayor salario o bonus?

-- 5. ¿Cómo se compara el target máximo del manager 13 con el de otros managers?

-- 6. ¿Cuál es la distribución de targets dentro del equipo del manager 13?

-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * He usado de nuevo una subconsulta para poder encontrar el dato que me piden.
