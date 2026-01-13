/* 
  Staging model: Cleaning raw financials.
  Applying GloBE Income adjustments based on PwC Catalog REF 2.070.
*/

WITH raw_fin AS (
    -- This links back to the source you just defined
    SELECT * FROM {{ source('raw_tax_data', 'fact_financials') }}
)

SELECT
    financial_id,
    entity_id,
    reporting_period,
    revenue,
    profit_before_tax,
    -- PwC Logic: GloBE Income = Profit + Disallowed Expenses (fines/penalties)
    (profit_before_tax + disallowed_expenses) AS globe_income,
    covered_taxes_paid,
    deferred_tax_adjustment,
    -- PwC Logic: Adjusted Covered Taxes = Current tax + deferred adjustments
    (covered_taxes_paid + deferred_tax_adjustment) AS adjusted_covered_taxes
FROM raw_fin
