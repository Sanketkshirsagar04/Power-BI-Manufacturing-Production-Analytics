# Manufacturing Production Analytics

A freelance manufacturing analytics project developed using **SQL Server, Power BI, DAX, Power Query, and Python** to transform manufacturing data into an interactive analytics solution.

The project focuses on production performance, profitability, quality, procurement, inventory, maintenance, and operational efficiency.

> **Data Confidentiality:** The original client data cannot be shared publicly due to confidentiality. To demonstrate the project structure and dashboard capabilities, a realistic synthetic dataset was generated using Python.

---

## 🏭 Project Context

This project was developed as a **freelance analytics project for a manufacturing business**.

Due to client confidentiality, the original client company information, operational data, and business-sensitive information are not included in this repository.

For portfolio demonstration purposes, the project uses the fictional company name:

**Orion Manufacturing LLC**

The synthetic environment represents a manufacturing organization operating across multiple U.S. locations.

---

## 🛠️ Tools & Technologies

| Technology | Usage |
|---|---|
| Python | Synthetic data generation |
| Pandas | Data preparation |
| SQL Server | Database development and data storage |
| SQL | Data querying and database management |
| Power Query | Data transformation |
| Power BI | Dashboard development |
| DAX | KPI and analytical calculations |
| Power BI Service | Report publishing and monitoring |
| On-Premises Data Gateway | Secure connectivity between Power BI Service and SQL Server |

---

## 🗂️ Data Model

The project uses a structured **star-schema data model** consisting of dimension and fact tables.

### Dimension Tables

- `Dim_Date`
- `Dim_Product`
- `Dim_Plant`
- `Dim_Machine`
- `Dim_Supplier`
- `Dim_Employee`
- `Dim_Shift`
- `Dim_Warehouse`

### Fact Tables

- `Fact_Production`
- `Fact_Inventory`
- `Fact_Procurement`
- `Fact_Quality`
- `Fact_Maintenance`

The Power BI semantic model is connected to the SQL Server database, with relationships established between the fact and dimension tables for interactive analysis.

---

## 🔄 Data & System Architecture

```text
Python
   │
   ▼
Synthetic CSV Data
   │
   ▼
SQL Server
Manufacturing_Analytics
   │
   ▼
Power BI Desktop
   │
   ▼
Power BI Service
   │
   ▼
On-Premises Data Gateway
   │
   ▼
SQL Server
