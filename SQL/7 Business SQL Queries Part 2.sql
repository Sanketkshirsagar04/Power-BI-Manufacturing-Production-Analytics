USE Manufacturing_Analytics;
GO

-- Query 21 : Plant-wise Production Quantity

SELECT
    DP.PlantName,
    CASE
        WHEN SUM(FP.QuantityProduced) >= 1000000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.QuantityProduced) >= 1000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.QuantityProduced),'N0')
    END AS TotalProduction
FROM Fact_Production FP
INNER JOIN Dim_Plant DP
ON FP.PlantKey = DP.PlantKey
GROUP BY DP.PlantName
ORDER BY SUM(FP.QuantityProduced) DESC;
GO

-- Query 22 : Plant-wise Revenue

SELECT
    DP.PlantName,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Plant DP
ON FP.PlantKey = DP.PlantKey
GROUP BY DP.PlantName
ORDER BY SUM(FP.GrossRevenue) DESC;
GO

-- Query 23 : Product-wise Revenue

SELECT
    P.ProductName,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.ProductName
ORDER BY SUM(FP.GrossRevenue) DESC;
GO

-- Query 24 : Product-wise Profit

SELECT
    P.ProductName,
    '$' +
    CASE
        WHEN SUM(FP.Profit) >= 1000000
            THEN FORMAT(SUM(FP.Profit)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.Profit) >= 1000
            THEN FORMAT(SUM(FP.Profit)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.Profit),'N2')
    END AS Profit
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.ProductName
ORDER BY SUM(FP.Profit) DESC;
GO

-- Query 25 : Category-wise Revenue

SELECT
    P.Category,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.Category
ORDER BY SUM(FP.GrossRevenue) DESC;
GO

-- Query 26 : Brand-wise Revenue

SELECT
    P.Brand,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.Brand
ORDER BY SUM(FP.GrossRevenue) DESC;
GO

-- Query 27 : Supplier-wise Procurement Cost

SELECT
    S.SupplierName,
    '$' +
    CASE
        WHEN SUM(FP.TotalProcurementCost) >= 1000000
            THEN FORMAT(SUM(FP.TotalProcurementCost)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.TotalProcurementCost) >= 1000
            THEN FORMAT(SUM(FP.TotalProcurementCost)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.TotalProcurementCost),'N2')
    END AS ProcurementCost
FROM Fact_Procurement FP
INNER JOIN Dim_Supplier S
ON FP.SupplierKey = S.SupplierKey
GROUP BY S.SupplierName
ORDER BY SUM(FP.TotalProcurementCost) DESC;
GO

-- Query 28 : Supplier-wise Purchase Amount

SELECT
    S.SupplierName,
    '$' +
    CASE
        WHEN SUM(FP.PurchaseAmount) >= 1000000
            THEN FORMAT(SUM(FP.PurchaseAmount)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.PurchaseAmount) >= 1000
            THEN FORMAT(SUM(FP.PurchaseAmount)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.PurchaseAmount),'N2')
    END AS PurchaseAmount
FROM Fact_Procurement FP
INNER JOIN Dim_Supplier S
ON FP.SupplierKey = S.SupplierKey
GROUP BY S.SupplierName
ORDER BY SUM(FP.PurchaseAmount) DESC;
GO

-- Query 29 : Warehouse-wise Inventory Value

SELECT
    W.WarehouseName,
    '$' +
    CASE
        WHEN SUM(FI.InventoryValue) >= 1000000
            THEN FORMAT(SUM(FI.InventoryValue)/1000000.0,'N2') + ' M'
        WHEN SUM(FI.InventoryValue) >= 1000
            THEN FORMAT(SUM(FI.InventoryValue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FI.InventoryValue),'N2')
    END AS InventoryValue
FROM Fact_Inventory FI
INNER JOIN Dim_Warehouse W
ON FI.WarehouseKey = W.WarehouseKey
GROUP BY W.WarehouseName
ORDER BY SUM(FI.InventoryValue) DESC;
GO

-- Query 30 : Warehouse-wise Closing Stock

SELECT
    W.WarehouseName,
    CASE
        WHEN SUM(FI.ClosingStock) >= 1000000
            THEN FORMAT(SUM(FI.ClosingStock)/1000000.0,'N2') + ' M'
        WHEN SUM(FI.ClosingStock) >= 1000
            THEN FORMAT(SUM(FI.ClosingStock)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FI.ClosingStock),'N0')
    END AS ClosingStock
FROM Fact_Inventory FI
INNER JOIN Dim_Warehouse W
ON FI.WarehouseKey = W.WarehouseKey
GROUP BY W.WarehouseName
ORDER BY SUM(FI.ClosingStock) DESC;
GO


-- Query 31 : Employee-wise Production Quantity

SELECT
    E.EmployeeName,
    CASE
        WHEN SUM(FP.QuantityProduced) >= 1000000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.QuantityProduced) >= 1000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.QuantityProduced),'N0')
    END AS ProductionQuantity
FROM Fact_Production FP
INNER JOIN Dim_Employee E
ON FP.EmployeeKey = E.EmployeeKey
GROUP BY E.EmployeeName
ORDER BY SUM(FP.QuantityProduced) DESC;
GO

-- Query 32 : Employee-wise Profit Generated

SELECT
    E.EmployeeName,
    '$' +
    CASE
        WHEN SUM(FP.Profit) >= 1000000
            THEN FORMAT(SUM(FP.Profit)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.Profit) >= 1000
            THEN FORMAT(SUM(FP.Profit)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.Profit),'N2')
    END AS ProfitGenerated
FROM Fact_Production FP
INNER JOIN Dim_Employee E
ON FP.EmployeeKey = E.EmployeeKey
GROUP BY E.EmployeeName
ORDER BY SUM(FP.Profit) DESC;
GO

-- Query 33 : Machine-wise Production Quantity

SELECT
    M.MachineName,
    CASE
        WHEN SUM(FP.QuantityProduced) >= 1000000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.QuantityProduced) >= 1000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.QuantityProduced),'N0')
    END AS ProductionQuantity
FROM Fact_Production FP
INNER JOIN Dim_Machine M
ON FP.MachineKey = M.MachineKey
GROUP BY M.MachineName
ORDER BY SUM(FP.QuantityProduced) DESC;
GO

-- Query 34 : Machine-wise Average OEE

SELECT
    M.MachineName,
    FORMAT(AVG(FP.OEE),'N2') + '%' AS AverageOEE
FROM Fact_Production FP
INNER JOIN Dim_Machine M
ON FP.MachineKey = M.MachineKey
GROUP BY M.MachineName
ORDER BY AVG(FP.OEE) DESC;
GO

-- Query 35 : Machine-wise Downtime

SELECT
    M.MachineName,
    FORMAT(SUM(FP.DowntimeMinutes),'N0') AS DowntimeMinutes
FROM Fact_Production FP
INNER JOIN Dim_Machine M
ON FP.MachineKey = M.MachineKey
GROUP BY M.MachineName
ORDER BY SUM(FP.DowntimeMinutes) DESC;
GO

-- Query 36 : Shift-wise Production Quantity

SELECT
    S.ShiftName,
    CASE
        WHEN SUM(FP.QuantityProduced) >= 1000000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.QuantityProduced) >= 1000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.QuantityProduced),'N0')
    END AS ProductionQuantity
FROM Fact_Production FP
INNER JOIN Dim_Shift S
ON FP.ShiftKey = S.ShiftKey
GROUP BY S.ShiftName
ORDER BY SUM(FP.QuantityProduced) DESC;
GO

-- Query 37 : Shift-wise Revenue

SELECT
    S.ShiftName,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Shift S
ON FP.ShiftKey = S.ShiftKey
GROUP BY S.ShiftName
ORDER BY SUM(FP.GrossRevenue) DESC;
GO

-- Query 38 : Plant-wise Average OEE

SELECT
    P.PlantName,
    FORMAT(AVG(FP.OEE),'N2') + '%' AS AverageOEE
FROM Fact_Production FP
INNER JOIN Dim_Plant P
ON FP.PlantKey = P.PlantKey
GROUP BY P.PlantName
ORDER BY AVG(FP.OEE) DESC;
GO

-- Query 39 : Top 10 Products by Profit

SELECT TOP 10
    P.ProductName,
    '$' +
    CASE
        WHEN SUM(FP.Profit) >= 1000000
            THEN FORMAT(SUM(FP.Profit)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.Profit) >= 1000
            THEN FORMAT(SUM(FP.Profit)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.Profit),'N2')
    END AS Profit
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.ProductName
ORDER BY SUM(FP.Profit) DESC;
GO

-- Query 40 : Bottom 10 Products by Profit

SELECT TOP 10
    P.ProductName,
    '$' +
    CASE
        WHEN SUM(FP.Profit) >= 1000000
            THEN FORMAT(SUM(FP.Profit)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.Profit) >= 1000
            THEN FORMAT(SUM(FP.Profit)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.Profit),'N2')
    END AS Profit
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.ProductName
ORDER BY SUM(FP.Profit) ASC;
GO