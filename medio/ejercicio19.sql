-- ============================================================
-- Employee and Manager Salaries
-- ============================================================

-- PROBLEMA
--
-- Se pide encontrar a los empleados que cobren mas que sus managers, imprimiendo el nombre del empleado y su salario.
--
-- Teniendo en cuenta que solo hay una tabla donde tengo el id del empleado y el id del manager, aqui estoy obligado a unir la misma tabla sobre sí misma.
--
-- En este caso la tabla E es del empleado y la M del manager, donde uno el manager del empleado con el id del manager.
-- Luego solo tengo que añadir la condición que el salario del empleado sea mayor que el del manager.

-- ============================================================
-- SOLUCIÓN
-- ============================================================

select
    E.first_name as first_name,
    E.salary as salary
from employee E
inner join employee M on E.manager_id = M.id
where E.salary > M.salary


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- La empresa quiere encontrar aquellos empleados que cobren mas que sus managers.
--
-- Lo que obtenemos de esta métrica son aquellos empleados que estén cobrando mas que sus managers
-- pero no sabemos si un empleado tiene mas antiguedad que su manager.
--
-- Que un empleado cobre mas que un manager es posible debido a varios factores, uno de ellos podría ser la 
-- antigüedad del empleado. (No sé cómo seguir esto porque creo que me estoy repitiendo bastante)


-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Cuál es la diferencia de trabajo entre el manager y el empleado?

-- 2. ¿Cuáles son las razones para comparar un empleado con un manager?

-- 3. ¿Hay empleados de distintos departamentos que cobren mas que sus managers?

-- 4. Teniendo en cuenta esos empleados que cobran más, ¿qué diferencia hay entre ambos salarios?

-- 5. ¿Estos son los únicos casos que han ocurrido en los últimos años?


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Usar una consulta sobre la misma tabla sabiendo que no tengo más tablas y que el id del manager está en la misma tabla.
--
-- * Una tabla cuenta como empleado y la otra como manager, para poder unirlo bien hay que unir el id del manager del empleado y el id del manager.