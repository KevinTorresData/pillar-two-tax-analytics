import pandas as pd
import numpy as np
from faker import Faker

fake = Faker()
# Set seed for reproducibility (so your data stays the same every time you run it)
np.random.seed(42)

# --- CONFIGURATION ---
NUM_SUBSIDIARIES = 400 # Matching the number mentioned in the PwC document
COUNTRIES = {
    'IE': {'name': 'Ireland', 'statutory_rate': 0.125},
    'AE': {'name': 'UAE', 'statutory_rate': 0.09},
    'CH': {'name': 'Switzerland', 'statutory_rate': 0.085},
    'BM': {'name': 'Bermuda', 'statutory_rate': 0.00},
    'SG': {'name': 'Singapore', 'statutory_rate': 0.17},
    'NL': {'name': 'Netherlands', 'statutory_rate': 0.258},
    'US': {'name': 'USA', 'statutory_rate': 0.21},
    'UK': {'name': 'UK', 'statutory_rate': 0.25},
    'DE': {'name': 'Germany', 'statutory_rate': 0.30},
    'KY': {'name': 'Cayman Islands', 'statutory_rate': 0.00}
}

# 1. GENERATE DIM_TAX_RULES (The Reference Data)
def create_tax_rules():
    tax_data = []
    for code, info in COUNTRIES.items():
        tax_data.append({
            'country_code': code,
            'country_name': info['name'],
            'statutory_rate': info['statutory_rate'],
            'pillar_two_minimum': 0.15 # The global floor
        })
    return pd.DataFrame(tax_data)

# 2. GENERATE DIM_ENTITIES (PwC Appx A - Master Data)
def create_entities():
    entities = []
    country_codes = list(COUNTRIES.keys())
    for i in range(NUM_SUBSIDIARIES):
        country = np.random.choice(country_codes)
        entities.append({
            'entity_id': f'ENT_{i+1:03d}',
            'entity_name': f"{fake.company()} {COUNTRIES[country]['name']}",
            'country_code': country,
            'entity_status': 'Constituent Entity',
            'is_safe_harbor_eligible': np.random.choice([True, False], p=[0.2, 0.8])
        })
    return pd.DataFrame(entities)

# 3. GENERATE FACT_FINANCIALS (PwC Appx B & C - Incomes & Taxes)
def create_financials(entities_df):
    financials = []
    for _, row in entities_df.iterrows():
        # Simulate Revenue and Profit (Enterprise Scale)
        revenue = np.random.uniform(50_000_000, 900_000_000)
        profit_margin = np.random.uniform(0.05, 0.30)
        profit = revenue * profit_margin
        
        # Pull Statutory Rate from the country
        stat_rate = COUNTRIES[row['country_code']]['statutory_rate']
        
        # Simulate 'Covered Taxes' (Current Tax Expense)
        # We add a bit of 'Tax Leakage' or 'Optimisation' variance
        actual_paid_rate = stat_rate + np.random.uniform(-0.03, 0.01)
        taxes_paid = profit * max(actual_paid_rate, 0)
        
        # PwC REF 2.070: Disallowed expenses (fines, etc)
        disallowed_expenses = profit * np.random.uniform(0.01, 0.05)
        
        financials.append({
            'financial_id': f"FIN_{row['entity_id']}",
            'entity_id': row['entity_id'],
            'reporting_period': '2024-Q4',
            'currency': 'USD',
            'revenue': round(revenue, 2),
            'profit_before_tax': round(profit, 2),
            'covered_taxes_paid': round(taxes_paid, 2),
            'disallowed_expenses': round(disallowed_expenses, 2),
            'deferred_tax_adjustment': round(profit * 0.01, 2)
        })
    return pd.DataFrame(financials)

# --- EXECUTION ---
print("🚀 Starting Data Factory...")

df_rules = create_tax_rules()
df_entities = create_entities()
df_financials = create_financials(df_entities)

# Save to CSV (These will be our 'Raw' layer files)
df_rules.to_csv('dim_tax_rules.csv', index=False)
df_entities.to_csv('dim_entities.csv', index=False)
df_financials.to_csv('fact_financials.csv', index=False)

print("✅ Data Generation Complete!")
print(f"Created {len(df_entities)} entities across {len(COUNTRIES)} jurisdictions.")
print("Files saved: dim_tax_rules.csv, dim_entities.csv, fact_financials.csv")
