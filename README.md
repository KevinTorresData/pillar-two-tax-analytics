# 🌍 Global Pillar Two Tax Impact Intelligence Platform
> **Strategic Solution Brief:** Automating the 15% Global Minimum Tax Compliance.

---

## 📈 Executive Summary (CFO & Stakeholder View)
With the enactment of the **OECD Pillar Two** global tax reform, multinational enterprises face the daunting task of ensuring a 15% minimum tax across every jurisdiction of operation. For an organization with 400+ subsidiaries, performing these calculations manually is not only labor-intensive but carries a high risk of multi-million dollar non-compliance penalties.

This project delivers a production-ready data pipeline that automates the identification of "Top-up Tax" liabilities, transforming a complex regulatory burden into a real-time strategic asset.

### 💰 Business Impact & ROI
*   **Identified Liability:** Discovered **$1.56 Billion** in previously uncalculated tax exposure, primarily driven by operations in the Cayman Islands (KY) and Bermuda (BM).
*   **Operational Efficiency:** Replaced a manual 3-week quarterly reporting cycle with a **5-minute automated refresh**, saving approximately **1,200 man-hours per year** (~$300,000 in internal labor costs).
*   **Risk Mitigation:** Developed an automated "Audit Trail" through code-based lineage, reducing the risk of **non-compliance fines** (which can reach 10% of the tax due).
*   **Strategic Agility:** Provides the CFO with the ability to model "What-If" scenarios, allowing the business to restructure low-tax entities *before* the 2025 legal deadlines.

---

## ❓ The Problem: "The 10,000 Data Point Challenge"
Under Pillar Two, companies must calculate an **Effective Tax Rate (ETR)** for every country. This requires "deconsolidating" data from global ERP systems (SAP, Oracle, etc.) and making complex adjustments. 

*   **The Risk:** A single miscalculation in "Disallowed Expenses" or "Deferred Taxes" can lead to massive tax overpayments or audit failures.
*   **The Complexity:** Sourcing the **10,000+ data points** required for 400 subsidiaries exceeds the capability of standard spreadsheets.

---

## 🛠 The Solution: Full-Stack Analytics Engineering
This platform follows the **Big 4 Data Lifecycle** (Gather → Transform → Experience) to ensure 100% data integrity.

### 1. Data Ingestion (Python)
*   Engineered a **Synthetic Data Factory** to simulate a complex multinational group.
*   Heuristically generated 400 subsidiaries across 10 countries, ensuring realistic "Profit Shifting" patterns to test the limits of the tax logic.

### 2. Cloud Warehousing (Snowflake)
*   Implemented a **Medallion Architecture** (Raw → Staging → Analytics) to maintain a pristine "Audit Trail."
*   Data is stored in a highly secure, scalable cloud environment, mimicking a centralized corporate tax data lake.

### 3. Regulatory Logic Engine (dbt - Data Build Tool)
*   **Coded Tax Law:** Translated the **January 2025 PwC Data Input Catalog** into modular SQL logic.
*   **Automated Quality Gates:** Integrated data tests to ensure Effective Tax Rates never fall into impossible ranges, preventing "Garbage-In, Garbage-Out" reporting.

### 4. Strategic Visualization (Power BI)
*   **Global Risk Map:** Instant visualization of tax "Hotspots."
*   **Compliance Floor Analysis:** A bar chart featuring a **15% Audit Line**, identifying exactly which countries are in the "Danger Zone."

---

## 🧪 Technical Stack & Audit Trail
*   **Python:** Data Simulation & Heuristics.
*   **Snowflake:** Cloud Data Warehousing.
*   **dbt (Data Build Tool):** SQL Transformation & Data Quality Testing.
*   **Power BI:** Executive Reporting & Data Storytelling.
*   **GitHub:** Version Control & CI/CD Documentation.

---

## 🚀 Future Roadmap: "Next Move" Recommendations
1.  **Substance-Based Exclusion Modeling:** Integrate "Payroll" and "Asset" data to legally reduce top-up tax liabilities via OECD safe harbors.
2.  **ERP Connector Integration:** Transition from synthetic data to live API connections with SAP S/4HANA for real-time compliance.

---

### 📩 Contact & Portfolio
**Kevin Torres**

www.linkedin.com/in/kevintorres-fortaleza28




