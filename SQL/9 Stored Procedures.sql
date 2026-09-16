USE Manufacturing_Analytics;
GO

-- Procedure 1 : Get Production by Date Range

CREATE PROCEDURE usp_GetProductionByDateRange

    @StartDate DATE,
    @EndDate DATE

AS
BEGIN

SET NOCOUNT ON;

SELECT

    D.Date,
    P.PlantName,
    PR.ProductName,

    F.QuantityProduced,
    F.GoodQuantity,
    F.RejectedQuantity,

    F.GrossRevenue,
    F.TotalCost,
    F.Profit,

    F.OEE

FROM Fact_Production F

INNER JOIN Dim_Date D
ON F.DateKey = D.DateKey

INNER JOIN Dim_Plant P
ON F.PlantKey = P.PlantKey

INNER JOIN Dim_Product PR
ON F.ProductKey = PR.ProductKey

WHERE D.Date BETWEEN @StartDate AND @EndDate

ORDER BY D.Date;

END;
GO


-- Test
EXEC usp_GetProductionByDateRange
'2023-01-01',
'2023-03-31';
GO


-- Procedure 2 : Get Plant Performance

CREATE PROCEDURE usp_GetPlantPerformance

@PlantName VARCHAR(100)

AS
BEGIN

SET NOCOUNT ON;

SELECT

    P.PlantName,

    SUM(F.QuantityProduced) AS QuantityProduced,

    SUM(F.GrossRevenue) AS Revenue,

    SUM(F.Profit) AS Profit,

    AVG(F.OEE) AS AverageOEE

FROM Fact_Production F

INNER JOIN Dim_Plant P
ON F.PlantKey = P.PlantKey

WHERE P.PlantName = @PlantName

GROUP BY P.PlantName;

END;
GO


-- Test 
EXEC usp_GetPlantPerformance
'Arizona Manufacturing Plant';
GO


-- Procedure 3 : Get Product Performance

CREATE PROCEDURE usp_GetProductPerformance

@ProductName VARCHAR(100)

AS
BEGIN

SET NOCOUNT ON;

SELECT

    P.ProductName,

    SUM(F.QuantityProduced) AS QuantityProduced,

    SUM(F.GrossRevenue) AS Revenue,

    SUM(F.Profit) AS Profit,

    AVG(F.ProfitMarginPct) AS ProfitMargin

FROM Fact_Production F

INNER JOIN Dim_Product P
ON F.ProductKey = P.ProductKey

WHERE P.ProductName = @ProductName

GROUP BY P.ProductName;

END;
GO


-- Test
EXEC usp_GetProductPerformance
'HDMI Cable';
GO


-- Procedure 4 : Get Supplier Performance

CREATE PROCEDURE usp_GetSupplierPerformance

@SupplierName VARCHAR(100)

AS
BEGIN

SET NOCOUNT ON;

SELECT

    S.SupplierName,

    COUNT(*) AS TotalOrders,

    SUM(F.TotalProcurementCost) AS ProcurementCost,

    AVG(F.SupplierPerformanceScore) AS PerformanceScore,

    AVG(F.FillRatePct) AS FillRate

FROM Fact_Procurement F

INNER JOIN Dim_Supplier S
ON F.SupplierKey = S.SupplierKey

WHERE S.SupplierName = @SupplierName

GROUP BY S.SupplierName;

END;
GO

-- Test
EXEC usp_GetSupplierPerformance
'Kingston';
GO
