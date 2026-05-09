SELECT 
    inspection_type,
    [no_risks_results],
    [Low Risk],
    [Moderate Risk],
    [High Risk],
    ([no_risks_results] + [Low Risk] + [Moderate Risk] + [High Risk]) AS total_inspections
FROM
(
    SELECT
        inspection_type,
        COALESCE(risk_category, 'no_risks_results') as risk_category,
        inspection_id
    FROM sf_restaurant_health_violations
) AS source_table
PIVOT
(
    COUNT(inspection_id)
    FOR risk_category IN ([no_risks_results], [Low Risk], [Moderate Risk], [High Risk])
) AS pivot_table