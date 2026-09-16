USE Manufacturing_Analytics;
GO


-- 1. Record Count

SELECT 'Dim_Date' AS TableName, COUNT(*) AS TotalRows FROM Dim_Date
UNION ALL
SELECT 'Dim_Product', COUNT(*) FROM Dim_Product
UNION ALL
SELECT 'Dim_Plant', COUNT(*) FROM Dim_Plant
UNION ALL
SELECT 'Dim_Machine', COUNT(*) FROM Dim_Machine
UNION ALL
SELECT 'Dim_Supplier', COUNT(*) FROM Dim_Supplier
UNION ALL
SELECT 'Dim_Employee', COUNT(*) FROM Dim_Employee
UNION ALL
SELECT 'Dim_Shift', COUNT(*) FROM Dim_Shift
UNION ALL
SELECT 'Dim_Warehouse', COUNT(*) FROM Dim_Warehouse
UNION ALL
SELECT 'Fact_Production', COUNT(*) FROM Fact_Production
UNION ALL
SELECT 'Fact_Inventory', COUNT(*) FROM Fact_Inventory
UNION ALL
SELECT 'Fact_Procurement', COUNT(*) FROM Fact_Procurement
UNION ALL
SELECT 'Fact_Quality', COUNT(*) FROM Fact_Quality
UNION ALL
SELECT 'Fact_Maintenance', COUNT(*) FROM Fact_Maintenance;
GO


-- 2. Duplicate Primary Keys

SELECT ProductionID, COUNT(*) DuplicateCount
FROM Fact_Production
GROUP BY ProductionID
HAVING COUNT(*) > 1;
GO

SELECT InventoryID, COUNT(*)
FROM Fact_Inventory
GROUP BY InventoryID
HAVING COUNT(*) > 1;
GO

SELECT ProcurementID, COUNT(*)
FROM Fact_Procurement
GROUP BY ProcurementID
HAVING COUNT(*) > 1;
GO

SELECT QualityID, COUNT(*)
FROM Fact_Quality
GROUP BY QualityID
HAVING COUNT(*) > 1;
GO

SELECT MaintenanceID, COUNT(*)
FROM Fact_Maintenance
GROUP BY MaintenanceID
HAVING COUNT(*) > 1;
GO


-- 3. Negative Revenue

SELECT *
FROM Fact_Production
WHERE GrossRevenue < 0;
GO


-- 4. Negative Costs

SELECT *
FROM Fact_Production
WHERE TotalCost < 0;
GO

SELECT *
FROM Fact_Procurement
WHERE TotalProcurementCost < 0;
GO

SELECT *
FROM Fact_Maintenance
WHERE TotalMaintenanceCost < 0;
GO


-- 5. Invalid OEE

SELECT *
FROM Fact_Production
WHERE OEE > 100
OR OEE < 0;
GO


-- 6. Invalid Defect Rate

SELECT *
FROM Fact_Quality
WHERE DefectRatePct > 100
OR DefectRatePct < 0;
GO


-- 7. Invalid Inventory

SELECT *
FROM Fact_Inventory
WHERE ClosingStock < 0;
GO


-- 8. Supplier Rating Check

SELECT *
FROM Dim_Supplier
WHERE Rating > 5
OR Rating < 0;
GO


-- 9. Employee Salary Check

SELECT *
FROM Dim_Employee
WHERE SalaryUSD < 0;
GO


-- 10. Product Price Check

SELECT *
FROM Dim_Product
WHERE UnitPrice < UnitCost;
GO


-- 11. Warehouse Capacity

SELECT *
FROM Dim_Warehouse
WHERE CapacityUnits <= 0;
GO


-- 12. Plant Capacity

SELECT *
FROM Dim_Plant
WHERE EmployeeCapacity <= 0;
GO

