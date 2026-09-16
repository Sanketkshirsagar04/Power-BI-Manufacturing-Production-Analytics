USE Manufacturing_Analytics;
GO

/*  1. Fact_Production  */

BULK INSERT Fact_Production
FROM 'E:\Power BI Project\Dataset\Fact Data\Fact_Production.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO


/*  2. Fact_Inventory  */

BULK INSERT Fact_Inventory
FROM 'E:\Power BI Project\Dataset\Fact Data\Fact_Inventory.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

/*  3. Fact_Procurement  */

BULK INSERT Fact_Procurement
FROM 'E:\Power BI Project\Dataset\Fact Data\Fact_Procurement.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO


/*  4. Fact_Quality  */
BULK INSERT Fact_Quality
FROM 'E:\Power BI Project\Dataset\Fact Data\Fact_Quality.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    CODEPAGE = '65001'
);

/*   5. Fact_Maintenance  */

BULK INSERT Fact_Maintenance
FROM 'E:\Power BI Project\Dataset\Fact Data\Fact_Maintenance.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

