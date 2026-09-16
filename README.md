# Manufacturing Production Analytics

A comprehensive manufacturing analytics solution built with **SQL Server, Power BI, DAX, Power Query, and Python** to analyze production performance, profitability, quality, procurement, inventory, and operational efficiency.

The project simulates a manufacturing company, **Orion Manufacturing LLC**, operating across multiple U.S. manufacturing plants.

---

## 📊 Project Overview

The goal of this project is to transform raw manufacturing data into an interactive executive analytics solution that helps stakeholders understand:

- Production performance
- Revenue and profitability
- Production costs
- Machine utilization
- Quality and defect trends
- Procurement spending
- Inventory value
- Maintenance costs
- Supplier performance
- Operational efficiency

The solution follows a complete analytics workflow:

**Python → CSV → SQL Server → Power BI → Power BI Service**

---

## 🏭 Company

**Orion Manufacturing LLC**

The simulated company operates manufacturing facilities across the United States, including:

- Chicago, Illinois
- Dallas, Texas
- Detroit, Michigan
- Phoenix, Arizona
- Atlanta, Georgia
- Nashville, Tennessee
- San Jose, California
- Columbus, Ohio

---

## 🛠️ Tools & Technologies

| Technology | Purpose |
|---|---|
| Python | Data generation and preparation |
| Pandas | Data manipulation |
| SQL Server | Data storage and analysis |
| SQL | Data modeling and querying |
| Power Query | Data transformation |
| Power BI | Dashboard and visualization |
| DAX | KPI and analytical measures |
| Power BI Service | Report publishing and scheduled refresh |
| On-Premises Data Gateway | SQL Server connectivity |

---

## 🗂️ Data Model

The project uses a **star-schema based data model** consisting of dimension and fact tables.

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

This structure allows the Power BI model to analyze manufacturing operations across different dimensions such as date, product, plant, machine, supplier, shift, and warehouse.

---

# 📈 Dashboard Pages

## 1. Executive Overview

Provides a high-level view of overall manufacturing performance.

### KPIs

- Production Revenue
- Total Production
- Production Profit
- Good Units

### Visualizations

- Production by Category
- Monthly Revenue vs Production Cost
- Production Profit by Product
- Defect Units by Product

---

## 2. Production Analysis

Focuses on production volume, costs, machine performance, and shifts.

### KPIs

- Total Production
- Production Cost
- Production Downtime
- Machine Utilization

### Visualizations

- Monthly Production Trend
- Production by Machine
- Production Cost by Product
- Production by Shift

---

## 3. Quality Analysis

Analyzes manufacturing quality and defect performance.

### KPIs

- Total Inspections
- Defect Units
- Defect Rate
- First Pass Yield

### Visualizations

- Monthly Quantity Trend
- Defect Rate vs First Pass Yield
- Quality Detail Table
- Defect Units by Product

---

## 4. Operations Analysis

Provides visibility into procurement, inventory, suppliers, and maintenance.

### KPIs

- Procurement Spend
- Inventory Value
- Maintenance Cost
- Supplier Count

### Visualizations

- Procurement Spend by Supplier
- Inventory Value by Warehouse
- Maintenance by Machine
- Procurement Spend by City

---

# 🎨 Dashboard Design

The dashboard includes both **Light Mode** and **Dark Mode** versions.

### Light Theme

- Clean white dashboard containers
- Light gray background
- Orange accent color
- Minimal borders
- Executive-style KPI cards

### Dark Theme

- Dark dashboard background
- Dark chart containers
- Orange accent color
- High-contrast typography
- Futuristic executive analytics design

Interactive navigation allows users to switch between Light and Dark dashboard versions.

---

# 📐 Key DAX Metrics

Examples of analytical measures used in the project include:

### Production Cost

```DAX
Production Cost =
SUM(Fact_Production[ProductionCost])
