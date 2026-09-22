-- ============================================================
-- Titanic Survivors and Non-Survivors
-- ============================================================

-- PROBLEMA
--
-- Se pide hacer un informe que muestre el número de supervivientes y no supervivientes del titanic
-- dividido por clases de pasajero.
--
-- Teniendo en cuenta que hay una columna llamada pclass que nos indica la clase a la que pertenecen los pasajeros,
-- la idea es sumar de 1 en 1 aquellos que cumplan con sus clases correspondientes. Como son 3 clases pues se usan los valores 1, 2 y 3.
--

-- ============================================================
-- SOLUCIÓN
-- ============================================================

select
    survived,
    sum(case when pclass = 1 then 1 else 0 end) as first_class,
    sum(case when pclass = 2 then 1 else 0 end) as second_class,
    sum(case when pclass = 3 then 1 else 0 end) as third_class
from titanic
group by survived


-- ¿Qué está detectando este resultado?
--
-- Este resultado nos indica aquellas personas que han sobrevivido y fallecido al incidente del titanic, segmentado por clases de pasajero.
--
-- ¿Qué no puedo saber con esto?
-- 
-- De los que sobrevivieron, si hubo algun capitan que supiera con exactitud qué provocó esa desgracia.
-- Diferencia entre cada clase de pasajero.
-- De los fallecidos cuantos eran hombre y cuantos mujer. (Esta realmente no me ayudaria a entender el resultado original)
-- Tipos de personas dependiendo de la clase, es decir, las personas de primera clase, si eran gerentes de una empresa grande.
--
-- ¿Qué contexto necesito?
--
-- Estado del barco, motivo de los que fallecieron, anecdotas de los que sobrevivieron.
--
-- ¿Qué análisis haría después?
--
-- Interrogar a los que sobrevivieron para saber qué ocurrió exactamente, de los fallecidos cuantas mujeres y cuantos hombres, rango de edad de los fallecidos.


-- ============================================================
-- ENFOQUE DE NEGOCIO
-- ============================================================

-- Este resultado nos indica aquellas personas que han sobrevivido y fallecido al incidente del titanic, segmentado por clases de pasajero.
-- Con este resultado observamos la gravedad del incidente del titanic.

-- ============================================================
-- PREGUNTAS ADICIONALES
-- ============================================================

-- 1. ¿Qué diferencia hay entre las clases de pasajeros?

-- 2. Aquello que sobrevivieron, ¿hubo algún testigo que se enterase cómo ocurrió la desgracia?

-- 3. Dependiendo de la clase de pasajero, ¿son personas de importancia? Hablamos de personas como gerentes de empresa, por ejemplo.


-- ============================================================
-- QUÉ APRENDÍ
-- ============================================================

-- * Usar los cases para poder contar casos con condiciones diferentes.
--
-- * Una segmentación así me aporta información valiosa pero solo sobre 1 condicion realmente.