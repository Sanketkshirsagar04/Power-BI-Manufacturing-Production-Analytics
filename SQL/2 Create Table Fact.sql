USE Manufacturing_Analytics;
GO

/*  1. Fact_Production  */

CREATE TABLE Fact_Production
(
    ProductionID INT NOT NULL,
    DateKey INT NOT NULL,
    PlantKey INT NOT NULL,
    MachineKey INT NOT NULL,
    EmployeeKey INT NOT NULL,
    ProductKey INT NOT NULL,
    ShiftKey INT NOT NULL,
    ProductionHours DECIMAL(5,2) NOT NULL,
    MachineUtilizationPct DECIMAL(5,2) NOT NULL,
    DowntimeMinutes INT NOT NULL,
    QuantityProduced INT NOT NULL,
    GoodQuantity INT NOT NULL,
    RejectedQuantity INT NOT NULL,
    DefectRatePct DECIMAL(5,2) NOT NULL,
    OEE DECIMAL(5,2) NOT NULL,
    UnitCost DECIMAL(18,2) NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    GrossRevenue DECIMAL(18,2) NOT NULL,
    ProductionCost DECIMAL(18,2) NOT NULL,
    DowntimeCost DECIMAL(18,2) NOT NULL,
    LaborCost DECIMAL(18,2) NOT NULL,
    ScrapCost DECIMAL(18,2) NOT NULL,
    TotalCost DECIMAL(18,2) NOT NULL,
    Profit DECIMAL(18,2) NOT NULL,
    ProfitMarginPct DECIMAL(5,2) NOT NULL,
    CostPerGoodUnit DECIMAL(18,2) NOT NULL,

    CONSTRAINT PK_Fact_Production
        PRIMARY KEY CLUSTERED (ProductionID)
);
GO

/*  2. Fact_Inventory  */

CREATE TABLE Fact_Inventory
(
    InventoryID INT NOT NULL,
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    WarehouseKey INT NOT NULL,
    SupplierKey INT NOT NULL,
    OpeningStock INT NOT NULL,
    StockReceived INT NOT NULL,
    StockIssued INT NOT NULL,
    ClosingStock INT NOT NULL,
    ReorderLevel INT NOT NULL,
    SafetyStock INT NOT NULL,
    InventoryValue DECIMAL(18,2) NOT NULL,
    InventoryStatus VARCHAR(30) NOT NULL,
    DailyDemand INT NOT NULL,
    InventoryTurnover DECIMAL(10,2) NOT NULL,
    DaysOfInventory DECIMAL(10,2) NOT NULL,
    WarehouseUtilizationPct DECIMAL(5,2) NOT NULL,
    CarryingCost DECIMAL(18,2) NOT NULL,
    StockAgeDays INT NOT NULL,
    ExpiredInventory INT NOT NULL,

    CONSTRAINT PK_Fact_Inventory
        PRIMARY KEY CLUSTERED (InventoryID)
);
GO

/*  3. Fact_Procurement  */

CREATE TABLE Fact_Procurement
(
    ProcurementID INT NOT NULL,
    PONumber VARCHAR(30) NOT NULL,
    DateKey INT NOT NULL,
    SupplierKey INT NOT NULL,
    ProductKey INT NOT NULL,
    PlantKey INT NOT NULL,
    OrderedQuantity INT NOT NULL,
    ReceivedQuantity INT NOT NULL,
    QuantityVariance INT NOT NULL,
    UnitCost DECIMAL(18,2) NOT NULL,
    PurchaseAmount DECIMAL(18,2) NOT NULL,
    FreightCost DECIMAL(18,2) NOT NULL,
    TaxAmount DECIMAL(18,2) NOT NULL,
    TotalProcurementCost DECIMAL(18,2) NOT NULL,
    LeadTimeDays INT NOT NULL,
    DeliveryDelayDays INT NOT NULL,
    FillRatePct DECIMAL(5,2) NOT NULL,
    QualityAcceptancePct DECIMAL(5,2) NOT NULL,
    SupplierRating DECIMAL(5,2) NOT NULL,
    SupplierPerformanceScore DECIMAL(5,2) NOT NULL,
    OrderStatus VARCHAR(30) NOT NULL,
    PaymentStatus VARCHAR(30) NOT NULL,

    CONSTRAINT PK_Fact_Procurement
        PRIMARY KEY CLUSTERED (ProcurementID)
);
GO

/*  4. Fact_Quality  */

CREATE TABLE Fact_Quality
(
    QualityID INT NOT NULL,
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    MachineKey INT NOT NULL,
    EmployeeKey INT NOT NULL,
    ShiftKey INT NOT NULL,
    PlantKey INT NOT NULL,
    InspectedQuantity INT NOT NULL,
    PassedQuantity INT NOT NULL,
    DefectiveQuantity INT NOT NULL,
    DefectRatePct DECIMAL(5,2) NOT NULL,
    InspectionResult VARCHAR(30) NOT NULL,
    DefectType VARCHAR(50) NOT NULL,
    InspectionTimeHours DECIMAL(5,2) NOT NULL,
    InspectorScore DECIMAL(5,2) NOT NULL,
    ReworkQuantity INT NOT NULL,
    ScrapQuantity INT NOT NULL,
    FirstPassYieldPct DECIMAL(5,2) NOT NULL,
    ReworkRatePct DECIMAL(5,2) NOT NULL,
    ScrapRatePct DECIMAL(5,2) NOT NULL,
    ReworkCost DECIMAL(18,2) NOT NULL,
    ScrapCost DECIMAL(18,2) NOT NULL,
    TotalQualityCost DECIMAL(18,2) NOT NULL,

    CONSTRAINT PK_Fact_Quality
        PRIMARY KEY CLUSTERED (QualityID)
);
GO

/*  5. Fact_Maintenance  */


CREATE TABLE Fact_Maintenance
(
    MaintenanceID INT NOT NULL,
    DateKey INT NOT NULL,
    MachineKey INT NOT NULL,
    EmployeeKey INT NOT NULL,
    PlantKey INT NOT NULL,
    MaintenanceType VARCHAR(30) NOT NULL,
    MaintenanceStatus VARCHAR(30) NOT NULL,
    Priority VARCHAR(20) NOT NULL,
    DowntimeMinutes INT NOT NULL,
    MaintenanceDurationHours DECIMAL(5,2) NOT NULL,
    LaborHours DECIMAL(5,2) NOT NULL,
    SparePartsCost DECIMAL(18,2) NOT NULL,
    LaborCost DECIMAL(18,2) NOT NULL,
    TotalMaintenanceCost DECIMAL(18,2) NOT NULL,
    MTTRHours DECIMAL(5,2) NOT NULL,
    MTBFDays DECIMAL(8,2) NOT NULL,
    MachineAvailabilityPct DECIMAL(5,2) NOT NULL,
    MaintenanceEfficiencyPct DECIMAL(5,2) NOT NULL,
    TechnicianRating DECIMAL(5,2) NOT NULL,
    RepeatFailure VARCHAR(10) NOT NULL,

    CONSTRAINT PK_Fact_Maintenance
        PRIMARY KEY CLUSTERED (MaintenanceID)
);
GO