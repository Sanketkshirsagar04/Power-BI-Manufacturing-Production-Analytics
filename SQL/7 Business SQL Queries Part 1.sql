USE Manufacturing_Analytics;
GO

-- Query 1 : Total Products

SELECT COUNT(*) AS TotalProducts
FROM Dim_Product;
GO

-- Query 2 : Total Employees

SELECT COUNT(*) AS TotalEmployees
FROM Dim_Employee;
GO

-- Query 3 : Total Machines

SELECT COUNT(*) AS TotalMachines
FROM Dim_Machine;
GO

-- Query 4 : Total Plants

SELECT COUNT(*) AS TotalPlants
FROM Dim_Plant;
GO

-- Query 5 : Total Warehouses

SELECT COUNT(*) AS TotalWarehouses
FROM Dim_Warehouse;
GO

-- Query 6 : Total Suppliers

SELECT COUNT(*) AS TotalSuppliers
FROM Dim_Supplier;
GO

-- Query 7 : Total Production Revenue

SELECT
    '$' +
    CASE
        WHEN SUM(GrossRevenue) >= 1000000
            THEN FORMAT(SUM(GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(GrossRevenue) >= 1000
            THEN FORMAT(SUM(GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(GrossRevenue),'N2')
    END AS TotalRevenue
FROM Fact_Production;
GO

-- Query 8 : Total Production Profit

SELECT
    '$' +
    CASE
        WHEN SUM(Profit) >= 1000000
            THEN FORMAT(SUM(Profit)/1000000.0,'N2') + ' M'
        WHEN SUM(Profit) >= 1000
            THEN FORMAT(SUM(Profit)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(Profit),'N2')
    END AS TotalProfit
FROM Fact_Production;
GO

-- Query 9 : Total Production Cost

SELECT
    '$' +
    CASE
        WHEN SUM(TotalCost) >= 1000000
            THEN FORMAT(SUM(TotalCost)/1000000.0,'N2') + ' M'
        WHEN SUM(TotalCost) >= 1000
            THEN FORMAT(SUM(TotalCost)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(TotalCost),'N2')
    END AS TotalCost
FROM Fact_Production;
GO

-- Query 10 : Average OEE

SELECT
    AVG(OEE) AS AverageOEE
FROM Fact_Production;
GO

-- Query 11 : Total Quantity Produced

SELECT
    CASE
        WHEN SUM(QuantityProduced) >= 1000000
            THEN FORMAT(SUM(QuantityProduced)/1000000.0,'N2') + ' M'
        WHEN SUM(QuantityProduced) >= 1000
            THEN FORMAT(SUM(QuantityProduced)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(QuantityProduced),'N0')
    END AS TotalProduction
FROM Fact_Production;
GO

-- Query 12 : Total Good Quantity

SELECT
    CASE
        WHEN SUM(GoodQuantity) >= 1000000
            THEN FORMAT(SUM(GoodQuantity)/1000000.0,'N2') + ' M'
        WHEN SUM(GoodQuantity) >= 1000
            THEN FORMAT(SUM(GoodQuantity)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(GoodQuantity),'N0')
    END AS GoodQuantity
FROM Fact_Production;
GO

-- Query 13 : Total Rejected Quantity

SELECT
    CASE
        WHEN SUM(RejectedQuantity) >= 1000000
            THEN FORMAT(SUM(RejectedQuantity)/1000000.0,'N2') + ' M'
        WHEN SUM(RejectedQuantity) >= 1000
            THEN FORMAT(SUM(RejectedQuantity)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(RejectedQuantity),'N0')
    END AS RejectedQuantity
FROM Fact_Production;
GO

-- Query 14 : Total Procurement Cost

SELECT
    '$' +
    CASE
        WHEN SUM(TotalProcurementCost) >= 1000000
            THEN FORMAT(SUM(TotalProcurementCost)/1000000.0,'N2') + ' M'
        WHEN SUM(TotalProcurementCost) >= 1000
            THEN FORMAT(SUM(TotalProcurementCost)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(TotalProcurementCost),'N2')
    END AS ProcurementCost
FROM Fact_Procurement;
GO

-- Query 15 : Total Inventory Value

SELECT
    '$' +
    CASE
        WHEN SUM(InventoryValue) >= 1000000
            THEN FORMAT(SUM(InventoryValue)/1000000.0,'N2') + ' M'
        WHEN SUM(InventoryValue) >= 1000
            THEN FORMAT(SUM(InventoryValue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(InventoryValue),'N2')
    END AS InventoryValue
FROM Fact_Inventory;
GO

-- Query 16 : Total Maintenance Cost

SELECT
    '$' +
    CASE
        WHEN SUM(TotalMaintenanceCost) >= 1000000
            THEN FORMAT(SUM(TotalMaintenanceCost)/1000000.0,'N2') + ' M'
        WHEN SUM(TotalMaintenanceCost) >= 1000
            THEN FORMAT(SUM(TotalMaintenanceCost)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(TotalMaintenanceCost),'N2')
    END AS MaintenanceCost
FROM Fact_Maintenance;
GO

-- Query 17 : Total Quality Cost

SELECT
    '$' +
    CASE
        WHEN SUM(TotalQualityCost) >= 1000000
            THEN FORMAT(SUM(TotalQualityCost)/1000000.0,'N2') + ' M'
        WHEN SUM(TotalQualityCost) >= 1000
            THEN FORMAT(SUM(TotalQualityCost)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(TotalQualityCost),'N2')
    END AS QualityCost
FROM Fact_Quality;
GO
-- Query 18 : Average Machine Utilization

SELECT
    AVG(MachineUtilizationPct) AS AvgMachineUtilization
FROM Fact_Production;
GO

-- Query 19 : Average Downtime

SELECT
    AVG(DowntimeMinutes) AS AvgDowntime
FROM Fact_Production;
GO

-- Query 20 : Average Profit Margin

SELECT
    AVG(ProfitMarginPct) AS AvgProfitMargin
FROM Fact_Production;
GO