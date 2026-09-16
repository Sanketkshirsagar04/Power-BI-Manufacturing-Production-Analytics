USE Manufacturing_Analytics;
GO

-- Query 41 : Revenue by Year

SELECT
    D.Year,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Date D
ON FP.DateKey = D.DateKey
GROUP BY D.Year
ORDER BY D.Year;
GO

-- Query 42 : Revenue by Quarter

SELECT
    D.QuarterName,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Date D
ON FP.DateKey = D.DateKey
GROUP BY D.QuarterName
ORDER BY D.QuarterName;
GO

-- Query 43 : Revenue by Month

SELECT
    D.MonthName,
    '$' +
    CASE
        WHEN SUM(FP.GrossRevenue) >= 1000000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.GrossRevenue) >= 1000
            THEN FORMAT(SUM(FP.GrossRevenue)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.GrossRevenue),'N2')
    END AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Date D
ON FP.DateKey = D.DateKey
GROUP BY D.Month, D.MonthName
ORDER BY D.Month;
GO

-- Query 44 : Production by Month

SELECT
    D.MonthName,
    CASE
        WHEN SUM(FP.QuantityProduced) >= 1000000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.QuantityProduced) >= 1000
            THEN FORMAT(SUM(FP.QuantityProduced)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.QuantityProduced),'N0')
    END AS Production
FROM Fact_Production FP
INNER JOIN Dim_Date D
ON FP.DateKey = D.DateKey
GROUP BY D.Month, D.MonthName
ORDER BY D.Month;
GO

-- Query 45 : Profit by Month

SELECT
    D.MonthName,
    '$' +
    CASE
        WHEN SUM(FP.Profit) >= 1000000
            THEN FORMAT(SUM(FP.Profit)/1000000.0,'N2') + ' M'
        WHEN SUM(FP.Profit) >= 1000
            THEN FORMAT(SUM(FP.Profit)/1000.0,'N2') + ' K'
        ELSE FORMAT(SUM(FP.Profit),'N2')
    END AS Profit
FROM Fact_Production FP
INNER JOIN Dim_Date D
ON FP.DateKey = D.DateKey
GROUP BY D.Month, D.MonthName
ORDER BY D.Month;
GO

-- Query 46 : Products with Revenue Greater Than $10 Million

SELECT
    P.ProductName,
    SUM(FP.GrossRevenue) AS Revenue
FROM Fact_Production FP
INNER JOIN Dim_Product P
ON FP.ProductKey = P.ProductKey
GROUP BY P.ProductName
HAVING SUM(FP.GrossRevenue) > 10000000
ORDER BY Revenue DESC;
GO

-- Query 47 : Plants with Profit Greater Than $5 Million

SELECT
    PL.PlantName,
    SUM(FP.Profit) AS Profit
FROM Fact_Production FP
INNER JOIN Dim_Plant PL
ON FP.PlantKey = PL.PlantKey
GROUP BY PL.PlantName
HAVING SUM(FP.Profit) > 5000000
ORDER BY Profit DESC;
GO

-- Query 48 : Suppliers with Procurement Cost Greater Than $2 Million

SELECT
    S.SupplierName,
    SUM(FP.TotalProcurementCost) AS ProcurementCost
FROM Fact_Procurement FP
INNER JOIN Dim_Supplier S
ON FP.SupplierKey = S.SupplierKey
GROUP BY S.SupplierName
HAVING SUM(FP.TotalProcurementCost) > 2000000
ORDER BY ProcurementCost DESC;
GO

-- Query 49 : Machines with Average OEE Greater Than 80%

SELECT
    M.MachineName,
    ROUND(AVG(FP.OEE),2) AS AverageOEE
FROM Fact_Production FP
INNER JOIN Dim_Machine M
ON FP.MachineKey = M.MachineKey
GROUP BY M.MachineName
HAVING AVG(FP.OEE) > 80
ORDER BY AverageOEE DESC;
GO

-- Query 50 : Employees Producing More Than 100K Units

SELECT
    E.EmployeeName,
    SUM(FP.QuantityProduced) AS ProductionQuantity
FROM Fact_Production FP
INNER JOIN Dim_Employee E
ON FP.EmployeeKey = E.EmployeeKey
GROUP BY E.EmployeeName
HAVING SUM(FP.QuantityProduced) > 100000
ORDER BY ProductionQuantity DESC;
GO