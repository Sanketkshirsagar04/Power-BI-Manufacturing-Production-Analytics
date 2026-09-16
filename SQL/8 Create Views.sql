USE Manufacturing_Analytics;
GO

-- View 1 : Production Summary

CREATE VIEW vw_ProductionSummary
AS
SELECT
    D.Date,
    D.Year,
    D.MonthName,
    P.PlantName,
    PR.ProductName,
    S.ShiftName,

    SUM(F.QuantityProduced) AS QuantityProduced,
    SUM(F.GoodQuantity) AS GoodQuantity,
    SUM(F.RejectedQuantity) AS RejectedQuantity,

    SUM(F.GrossRevenue) AS GrossRevenue,
    SUM(F.TotalCost) AS TotalCost,
    SUM(F.Profit) AS Profit,

    AVG(F.OEE) AS AverageOEE,
    AVG(F.MachineUtilizationPct) AS MachineUtilization

FROM Fact_Production F

INNER JOIN Dim_Date D
ON F.DateKey=D.DateKey

INNER JOIN Dim_Plant P
ON F.PlantKey=P.PlantKey

INNER JOIN Dim_Product PR
ON F.ProductKey=PR.ProductKey

INNER JOIN Dim_Shift S
ON F.ShiftKey=S.ShiftKey

GROUP BY

D.Date,
D.Year,
D.MonthName,
P.PlantName,
PR.ProductName,
S.ShiftName;
GO



-- Check View
SELECT TOP 100 *
FROM vw_ProductionSummary;
GO




-- View 2 : Product Performance

CREATE VIEW vw_ProductPerformance
AS

SELECT

    P.ProductKey,
    P.ProductCode,
    P.ProductName,
    P.Category,
    P.SubCategory,
    P.Brand,

    SUM(F.QuantityProduced) AS QuantityProduced,
    SUM(F.GoodQuantity) AS GoodQuantity,
    SUM(F.RejectedQuantity) AS RejectedQuantity,

    SUM(F.GrossRevenue) AS GrossRevenue,
    SUM(F.TotalCost) AS TotalCost,
    SUM(F.Profit) AS Profit,

    AVG(F.ProfitMarginPct) AS AvgProfitMargin,
    AVG(F.OEE) AS AvgOEE

FROM Fact_Production F

INNER JOIN Dim_Product P
ON F.ProductKey = P.ProductKey

GROUP BY

    P.ProductKey,
    P.ProductCode,
    P.ProductName,
    P.Category,
    P.SubCategory,
    P.Brand;
GO



-- Check View
SELECT TOP 100 *
FROM vw_ProductPerformance;
GO


-- View 3 : Plant Performance

CREATE VIEW vw_PlantPerformance
AS

SELECT

    P.PlantKey,
    P.PlantCode,
    P.PlantName,
    P.City,
    P.State,
    P.Region,

    SUM(F.QuantityProduced) AS QuantityProduced,
    SUM(F.GoodQuantity) AS GoodQuantity,

    SUM(F.GrossRevenue) AS Revenue,
    SUM(F.TotalCost) AS TotalCost,
    SUM(F.Profit) AS Profit,

    AVG(F.OEE) AS AvgOEE,
    AVG(F.MachineUtilizationPct) AS AvgMachineUtilization

FROM Fact_Production F

INNER JOIN Dim_Plant P
ON F.PlantKey = P.PlantKey

GROUP BY

    P.PlantKey,
    P.PlantCode,
    P.PlantName,
    P.City,
    P.State,
    P.Region;
GO

-- Check View
SELECT TOP 100 *
FROM vw_PlantPerformance;
GO


-- View 4 : Inventory Summary

CREATE VIEW vw_InventorySummary
AS

SELECT

    W.WarehouseKey,
    W.WarehouseName,
    W.WarehouseType,

    P.ProductKey,
    P.ProductName,
    P.Category,

    SUM(FI.OpeningStock) AS OpeningStock,
    SUM(FI.StockReceived) AS StockReceived,
    SUM(FI.StockIssued) AS StockIssued,
    SUM(FI.ClosingStock) AS ClosingStock,

    SUM(FI.InventoryValue) AS InventoryValue,

    AVG(FI.InventoryTurnover) AS InventoryTurnover,
    AVG(FI.DaysOfInventory) AS DaysOfInventory,
    AVG(FI.WarehouseUtilizationPct) AS WarehouseUtilization

FROM Fact_Inventory FI

INNER JOIN Dim_Product P
ON FI.ProductKey = P.ProductKey

INNER JOIN Dim_Warehouse W
ON FI.WarehouseKey = W.WarehouseKey

GROUP BY

    W.WarehouseKey,
    W.WarehouseName,
    W.WarehouseType,

    P.ProductKey,
    P.ProductName,
    P.Category;
GO


-- Check View
SELECT TOP 100 *
FROM vw_InventorySummary;
GO


-- View 5 : Supplier Performance

CREATE VIEW vw_SupplierPerformance
AS

SELECT

    S.SupplierKey,
    S.SupplierCode,
    S.SupplierName,
    S.Category,
    S.Country,

    COUNT(FP.ProcurementID) AS TotalOrders,

    SUM(FP.OrderedQuantity) AS OrderedQuantity,
    SUM(FP.ReceivedQuantity) AS ReceivedQuantity,

    SUM(FP.TotalProcurementCost) AS ProcurementCost,

    AVG(FP.LeadTimeDays) AS AvgLeadTime,
    AVG(FP.FillRatePct) AS AvgFillRate,
    AVG(FP.QualityAcceptancePct) AS AvgQualityAcceptance,

    AVG(FP.SupplierPerformanceScore) AS SupplierPerformanceScore

FROM Fact_Procurement FP

INNER JOIN Dim_Supplier S
ON FP.SupplierKey = S.SupplierKey

GROUP BY

    S.SupplierKey,
    S.SupplierCode,
    S.SupplierName,
    S.Category,
    S.Country;
GO


-- Check View
SELECT TOP 100 *
FROM vw_SupplierPerformance;
GO



-- View 6 : Executive Dashboard

CREATE VIEW vw_ExecutiveDashboard
AS

SELECT

    /* Production KPIs */

    (SELECT SUM(GrossRevenue)
     FROM Fact_Production) AS TotalRevenue,

    (SELECT SUM(Profit)
     FROM Fact_Production) AS TotalProfit,

    (SELECT SUM(TotalCost)
     FROM Fact_Production) AS TotalProductionCost,

    (SELECT SUM(QuantityProduced)
     FROM Fact_Production) AS TotalProduction,

    (SELECT AVG(OEE)
     FROM Fact_Production) AS AverageOEE,

    (SELECT AVG(MachineUtilizationPct)
     FROM Fact_Production) AS AverageMachineUtilization,

    (SELECT AVG(ProfitMarginPct)
     FROM Fact_Production) AS AverageProfitMargin,

    /* Procurement KPIs */

    (SELECT SUM(TotalProcurementCost)
     FROM Fact_Procurement) AS TotalProcurementCost,

    (SELECT AVG(SupplierPerformanceScore)
     FROM Fact_Procurement) AS AverageSupplierPerformance,

    /* Inventory KPIs */

    (SELECT SUM(InventoryValue)
     FROM Fact_Inventory) AS TotalInventoryValue,

    (SELECT AVG(InventoryTurnover)
     FROM Fact_Inventory) AS AverageInventoryTurnover,

    /* Quality KPIs */

    (SELECT SUM(TotalQualityCost)
     FROM Fact_Quality) AS TotalQualityCost,

    (SELECT AVG(FirstPassYieldPct)
     FROM Fact_Quality) AS AverageFirstPassYield,

    /* Maintenance KPIs */

    (SELECT SUM(TotalMaintenanceCost)
     FROM Fact_Maintenance) AS TotalMaintenanceCost,

    (SELECT AVG(MachineAvailabilityPct)
     FROM Fact_Maintenance) AS AverageMachineAvailability;
GO


-- Check View
SELECT *
FROM vw_ExecutiveDashboard;
GO