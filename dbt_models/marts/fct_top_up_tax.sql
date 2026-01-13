/*
  Final Mart: Calculating Pillar Two Top-Up Tax Liability.
  This joins our cleaned financials with the entity master data
  to find jurisdictions paying < 15% tax.
*/

WITH financials AS (
    -- Reference our 'Staging' model from the previous step
    SELECT * FROM {{ ref('stg_financials') }}
),

entities AS (
    -- Reference our 'Raw' entity master table
    SELECT * FROM {{ source('raw_tax_data', 'dim_entities') }}
),

-- Join data and calculate ETR per Subsidiary
joined AS (
    SELECT 
        e.entity_name,
        e.country_code,
        f.globe_income,
        f.adjusted_covered_taxes,
        -- Effective Tax Rate calculation (Adjusted Taxes / GloBE Income)
        CASE 
            WHEN f.globe_income > 0 THEN (f.adjusted_covered_taxes / f.globe_income)
            ELSE 0 
        END AS effective_tax_rate
    FROM financials f
    JOIN entities e ON f.entity_id = e.entity_id
)

SELECT 
    *,
    -- Pillar Two Logic: Top-up tax rate is the gap between ETR and 15%
    CASE 
        WHEN effective_tax_rate < 0.15 THEN (0.15 - effective_tax_rate)
        ELSE 0 
    END AS top_up_tax_rate,
    
    -- The "Found Cash": Calculating the total tax liability in USD
    (top_up_tax_rate * globe_income) AS top_up_tax_liability
FROM joined
