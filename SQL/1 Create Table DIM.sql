/*=========================================================
    DIMENSION TABLES
    Project : Manufacturing Analytics
=========================================================*/

CREATE DATABASE Manufacturing_Analytics;
GO

USE Manufacturing_Analytics;
GO

/*=========================================================
1. Dim_Date
=========================================================*/

CREATE TABLE Dim_Date
(
    DateKey INT NOT NULL,
    [Date] DATE NOT NULL,
    [Year] INT NOT NULL,
    Quarter INT NOT NULL,
    QuarterName VARCHAR(20) NOT NULL,
    [Month] INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    MonthShort VARCHAR(10) NOT NULL,
    WeekOfYear INT NOT NULL,
    [Day] INT NOT NULL,
    DayName VARCHAR(20) NOT NULL,
    DayShort VARCHAR(10) NOT NULL,
    DayOfWeek INT NOT NULL,
    IsWeekend BIT NOT NULL,
    IsBusinessDay BIT NOT NULL,
    IsMonthStart BIT NOT NULL,
    IsMonthEnd BIT NOT NULL,
    IsQuarterStart BIT NOT NULL,
    IsQuarterEnd BIT NOT NULL,
    IsYearStart BIT NOT NULL,
    IsYearEnd BIT NOT NULL,
    FinancialYear VARCHAR(20) NOT NULL,
    MonthYear VARCHAR(20) NOT NULL,
    YearMonth VARCHAR(10) NOT NULL,

    CONSTRAINT PK_Dim_Date
        PRIMARY KEY CLUSTERED (DateKey)
);
GO

/*=========================================================
2. Dim_Product
=========================================================*/

CREATE TABLE Dim_Product
(
    ProductKey INT NOT NULL,
    ProductCode VARCHAR(20) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    SubCategory VARCHAR(50) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Unit VARCHAR(20) NOT NULL,
    UnitCost DECIMAL(18,2) NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    WeightKG DECIMAL(10,2) NOT NULL,
    WarrantyMonths INT NOT NULL,
    LifecycleStatus VARCHAR(30) NOT NULL,

    CONSTRAINT PK_Dim_Product
        PRIMARY KEY CLUSTERED(ProductKey)
);
GO
/*=========================================================
3. Dim_Plant
=========================================================*/

CREATE TABLE Dim_Plant
(
    PlantKey INT NOT NULL,
    PlantCode VARCHAR(20) NOT NULL,
    PlantName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Region VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    PlantType VARCHAR(50) NOT NULL,
    EstablishedYear INT NOT NULL,
    AreaSqFt INT NOT NULL,
    ProductionLines INT NOT NULL,
    EmployeeCapacity INT NOT NULL,
    WarehouseCapacity INT NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Dim_Plant
        PRIMARY KEY CLUSTERED(PlantKey)
);
GO

/*=========================================================
4. Dim_Machine
=========================================================*/

CREATE TABLE Dim_Machine
(
    MachineKey INT NOT NULL,
    MachineCode VARCHAR(20) NOT NULL,
    MachineName VARCHAR(100) NOT NULL,
    PlantKey INT NOT NULL,
    MachineType VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(100) NOT NULL,
    InstallationYear INT NOT NULL,
    CapacityPerHour INT NOT NULL,
    EfficiencyTarget INT NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Dim_Machine
        PRIMARY KEY CLUSTERED(MachineKey)
);
GO

/*=========================================================
5. Dim_Supplier
=========================================================*/

CREATE TABLE Dim_Supplier
(
    SupplierKey INT NOT NULL,
    SupplierCode VARCHAR(20) NOT NULL,
    SupplierName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    LeadTimeDays INT NOT NULL,
    Rating DECIMAL(5,2) NOT NULL,
    PaymentTerms VARCHAR(30) NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Dim_Supplier
        PRIMARY KEY CLUSTERED(SupplierKey)
);
GO

/*=========================================================
6. Dim_Employee
=========================================================*/

CREATE TABLE Dim_Employee
(
    EmployeeKey INT NOT NULL,
    EmployeeCode VARCHAR(20) NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Department VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(100) NOT NULL,
    PlantKey INT NOT NULL,
    ExperienceYears INT NOT NULL,
    Education VARCHAR(50) NOT NULL,
    EmploymentType VARCHAR(30) NOT NULL,
    SalaryUSD DECIMAL(18,2) NOT NULL,
    HireYear INT NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Dim_Employee
        PRIMARY KEY CLUSTERED(EmployeeKey)
);
GO

/*=========================================================
7. Dim_Shift
=========================================================*/

CREATE TABLE Dim_Shift
(
    ShiftKey INT NOT NULL,
    ShiftCode VARCHAR(20) NOT NULL,
    ShiftName VARCHAR(50) NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    DurationHours INT NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Dim_Shift
        PRIMARY KEY CLUSTERED(ShiftKey)
);
GO

/*=========================================================
8. Dim_Warehouse
=========================================================*/

CREATE TABLE Dim_Warehouse
(
    WarehouseKey INT NOT NULL,
    WarehouseCode VARCHAR(20) NOT NULL,
    WarehouseName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Region VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    CapacityUnits INT NOT NULL,
    WarehouseType VARCHAR(50) NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Dim_Warehouse
        PRIMARY KEY CLUSTERED(WarehouseKey)
);
GO