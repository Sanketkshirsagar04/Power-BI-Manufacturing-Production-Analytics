USE Manufacturing_Analytics;
GO

/*  1. Dim_Date  */

BULK INSERT Dim_Date
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Date.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

/*  2. Dim_Product  */

BULK INSERT Dim_Product
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Product.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

/*  3. Dim_Plant  */

BULK INSERT Dim_Plant
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Plant.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

/*  4. Dim_Machine  */

BULK INSERT Dim_Machine
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Machine.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO


/*  5. Dim_Supplier  */

BULK INSERT Dim_Supplier
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Supplier.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO


/*  6. Dim_Employee  */

BULK INSERT Dim_Employee
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Employee.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO


/*  7. Dim_Shift  */

BULK INSERT Dim_Shift
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Shift.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

/*  8. Dim_Warehouse  */

BULK INSERT Dim_Warehouse
FROM 'E:\Power BI Project\Dataset\Dim Data\Dim_Warehouse.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

