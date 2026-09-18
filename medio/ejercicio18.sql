-- ============================================================
-- Highest Salary In Department
-- ============================================================

-- PROBLEMA
--
-- Se solicita encontrar los empleados cuyo salario sea el más alto
-- de cada departamento.
--
-- Teniendo en cuenta lo que pide el ejercicio, lo ideal es encontrar
-- primero el salario máximo por cada departamento y después unirlo
-- a la tabla de empleados para obtener el nombre del empleado.
--
-- Es importante tener en cuenta que puede haber varios empleados
-- con el mismo salario máximo dentro de un departamento, por lo que
-- la solución debe devolverlos a todos.


-- ============================================================
-- SOLUCIÓN
-- ============================================================

WITH salary_department AS (
    SELECT
        department,
        MAX(salary) AS salary
    FROM employee
    GROUP BY department
)

SELECT
    E.department AS department,
    E.first_name AS first_name,
    S.salary AS salary
FROM employee E
INNER JOIN salary_department S
    ON S.department = E.department
    AND S.salary = E.salary;


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- La empresa quiere identificar al empleado con mayor salario
-- dentro de cada departamento para realizar comparaciones y
-- revisiones de compensación.
--
-- El resultado nos permite conocer quién se encuentra en el extremo
-- superior de la estructura salarial de cada departamento, pero por
-- sí solo no permite determinar si existe un problema salarial.
--
-- Un salario elevado puede estar relacionado con factores como el
-- puesto, nivel de responsabilidad, experiencia o antigüedad.
-- Por tanto, sería necesario añadir contexto antes de sacar
-- conclusiones sobre posibles diferencias salariales.


-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Qué diferencia existe entre el salario máximo y el salario
--    medio o mediano de cada departamento?
--
--    Esto permitiría saber si el empleado con mayor salario está
--    muy alejado del resto del departamento o si existe una
--    estructura salarial más homogénea.


-- 2. ¿Qué puesto ocupa el empleado con mayor salario de cada
--    departamento?
--
--    Esto permitiría comprobar si las diferencias salariales pueden
--    estar relacionadas con el nivel de responsabilidad o el tipo
--    de puesto.


-- 3. ¿Cómo se compara el salario máximo entre los diferentes
--    departamentos?
--
--    Esto permitiría detectar diferencias en las estructuras
--    salariales de cada departamento.


-- 4. ¿Existen varios empleados con el mismo salario máximo dentro
--    de un departamento?
--
--    En caso de existir empates, sería interesante comprobar si
--    estos empleados tienen el mismo puesto o nivel profesional.


-- 5. ¿Existen diferencias salariales dentro de un mismo puesto y
--    departamento?
--
--    Esto permitiría analizar si empleados con características
--    profesionales similares presentan diferencias salariales.


-- 6. ¿Cómo han evolucionado los salarios máximos de cada departamento
--    a lo largo del tiempo?
--
--    Para responder a esta pregunta sería necesario disponer de
--    información salarial histórica.


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Utilizar MAX() junto con GROUP BY para encontrar el valor máximo
--   dentro de cada grupo.
--
-- * Utilizar una CTE para calcular primero una métrica agregada y
--   posteriormente utilizarla para recuperar información de la
--   tabla original.
--
-- * Al buscar un valor máximo, hay que tener en cuenta los posibles
--   empates y asegurarse de devolver todos los registros que tengan
--   dicho valor.
--
-- * Un valor máximo por sí solo no explica si existe una anomalía.
--   Para interpretar un resultado empresarial es necesario añadir
--   contexto y comparar el resultado con otras métricas o variables.