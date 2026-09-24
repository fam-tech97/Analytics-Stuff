-- ============================================================
-- Duplicate HR Department Employees
-- ============================================================

-- PROBLEMA
--
-- Se pide una lista de los empleados que trabajan en el departamentos de recursos humanos, mostrando su primer nombre y departamento.
-- Además se solicita que cada empleado de recursos humanos aparezca duplicado.
--
-- Teniendo en cuenta lo que solicita el ejercicio, hay varias formas de hacerlo pero la que he elegido yo ha sido usar UNION ALL.
-- Hago la misma consulta 2 veces con el UNION ALL ya que me devuelve lo que pida en el select sin borrar los duplicados, a diferencia
-- de lo que hace el UNION.

-- ============================================================
-- SOLUCIÓN
-- ============================================================

select first_name, department from worker where department = 'HR'
UNION ALL
select first_name, department from worker where department = 'HR'

-- ¿Qué información produce esta consulta?
--
-- Genera una lista de los empleados que trabajan en HR,
-- mostrando su nombre y departamento, con cada empleado
-- apareciendo dos veces.
--
-- ¿Qué me falta para interpretar mejor el resultado?
--
-- El número total de empleados de HR y, si quisiera analizar
-- el departamento, otros datos como cargo, salario o antigüedad.


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- El ejercicio permite identificar a los empleados pertenecientes
-- al departamento de HR. Sin embargo, la duplicación solicitada
-- parece responder principalmente a un requisito técnico del
-- ejercicio y no a una necesidad de negocio evidente.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Cuántos empleados pertenecen al departamento de HR?
--
-- 2. ¿Qué porcentaje de la plantilla pertenece a HR?


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * UNION ALL permite combinar resultados manteniendo los duplicados.
-- * No todos los ejercicios de SQL tienen necesariamente un caso
--   de negocio relevante; algunos están centrados principalmente
--   en practicar una herramienta o concepto concreto.