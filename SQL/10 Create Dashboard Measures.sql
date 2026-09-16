USE Manufacturing_Analytics;
GO

-- KPI 1 : Total Revenue

SELECT
SUM(GrossRevenue) AS TotalRevenue
FROM Fact_Production;
GO

-- KPI 2 : Total Profit

SELECT
SUM(Profit) AS TotalProfit
FROM Fact_Production;
GO

-- KPI 3 : Total Production Cost

SELECT
SUM(TotalCost) AS TotalProductionCost
FROM Fact_Production;
GO

-- KPI 4 : Total Production

SELECT
SUM(QuantityProduced) AS TotalProduction
FROM Fact_Production;
GO

-- KPI 5 : Total Good Quantity

SELECT
SUM(GoodQuantity) AS GoodQuantity
FROM Fact_Production;
GO

-- KPI 6 : Total Rejected Quantity

SELECT
SUM(RejectedQuantity) AS RejectedQuantity
FROM Fact_Production;
GO

-- KPI 7 : Average OEE

SELECT
AVG(OEE) AS AverageOEE
FROM Fact_Production;
GO

-- KPI 8 : Average Machine Utilization

SELECT
AVG(MachineUtilizationPct) AS MachineUtilization
FROM Fact_Production;
GO

-- KPI 9 : Inventory Value

SELECT
SUM(InventoryValue) AS InventoryValue
FROM Fact_Inventory;
GO

-- KPI 10 : Procurement Cost

SELECT
SUM(TotalProcurementCost) AS ProcurementCost
FROM Fact_Procurement;
GO

-- KPI 11 : Maintenance Cost

SELECT
SUM(TotalMaintenanceCost) AS MaintenanceCost
FROM Fact_Maintenance;
GO

-- KPI 12 : Quality Cost

SELECT
SUM(TotalQualityCost) AS QualityCost
FROM Fact_Quality;
GO