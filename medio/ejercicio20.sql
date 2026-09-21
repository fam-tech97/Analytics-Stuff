-- ============================================================
-- Second Highest Salary
-- ============================================================

-- PROBLEMA
--
-- Se pide encontrar el segundo salario más alto de la empresa.
--
-- Teniendo en cuenta que la tabla que nos aportan es la del empleado, hay varias maneras de hacerlo por lo que 
-- usaré la función de ventana rank para hacer un ranking de los salarios, ordenados de manera descendente.
--

-- ============================================================
-- SOLUCIÓN
-- ============================================================

with ranking as (
    select
        salary,
        dense_rank() over(order by salary desc) as rango
    from employee
)

select salary from ranking where rango = 2

-- ¿Qué está detectando este resultado?
--
-- Estamos obteniendo un salario que, dependiendo del contexto, merece un análisis mas en profundidad y con mas parámetros o variables.
--
-- ¿Qué no puedo saber con esto?
--
-- Empleado al que corresponde este salario, si es un salario alto o bajo, si este salario es el maximo de un departamento, del primer salario al segundo salario cuanta diferencia hay, si corresponde a un manager o a un empleado.
--
-- ¿Qué contexto necesito?
--
-- Puesto del empleado que cobra esto, departamento al que corresponde, antiguedad que lleva en la empresa.
--
-- ¿Qué análisis haría después?
--
-- Comparar el salario mas grande con el segundo mas grande, a qué departamento y qué puesto corresponde este salario, estructura salarial dependiendo del departamento y del puesto de trabajo.


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- El resultado identifica el segundo salario más alto de la empresa, pero por sí solo no permite interpretar si este nivel salarial 
-- es elevado respecto a la estructura salarial de la empresa ni qué características explican que exista.


-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿A quién le corresponde este salario?

-- 2. ¿Qué diferencia salarial hay entre el primer salario mas grande y el tercero mas grande?

-- 3. ¿A qué departamento corresponde este salario?

-- 4. ¿El segundo salario más alto corresponde a un empleado que ocupa una posición de manager?

-- 5. ¿Cuál es la estructura salarial por cada departamento?

-- 6. ¿Cuántos empleados están cerca de ese nivel salarial?


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Usar una CTE para calcular rangos, usando la función rank() y luego poder filtrar por el rango deseado.
--
-- * Un ranking me dice la posición relativa de un valor, pero no me dice la distancia entre valores ni el contexto de ese valor.