USE Manufacturing_Analytics;
GO

-- Fact_Production

ALTER TABLE Fact_Production
ADD CONSTRAINT FK_FactProduction_Date
FOREIGN KEY (DateKey)
REFERENCES Dim_Date(DateKey);
GO

ALTER TABLE Fact_Production
ADD CONSTRAINT FK_FactProduction_Plant
FOREIGN KEY (PlantKey)
REFERENCES Dim_Plant(PlantKey);
GO

ALTER TABLE Fact_Production
ADD CONSTRAINT FK_FactProduction_Machine
FOREIGN KEY (MachineKey)
REFERENCES Dim_Machine(MachineKey);
GO

ALTER TABLE Fact_Production
ADD CONSTRAINT FK_FactProduction_Employee
FOREIGN KEY (EmployeeKey)
REFERENCES Dim_Employee(EmployeeKey);
GO

ALTER TABLE Fact_Production
ADD CONSTRAINT FK_FactProduction_Product
FOREIGN KEY (ProductKey)
REFERENCES Dim_Product(ProductKey);
GO

ALTER TABLE Fact_Production
ADD CONSTRAINT FK_FactProduction_Shift
FOREIGN KEY (ShiftKey)
REFERENCES Dim_Shift(ShiftKey);
GO


-- Fact_Inventory

ALTER TABLE Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Date
FOREIGN KEY (DateKey)
REFERENCES Dim_Date(DateKey);
GO

ALTER TABLE Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Product
FOREIGN KEY (ProductKey)
REFERENCES Dim_Product(ProductKey);
GO

ALTER TABLE Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Warehouse
FOREIGN KEY (WarehouseKey)
REFERENCES Dim_Warehouse(WarehouseKey);
GO

ALTER TABLE Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Supplier
FOREIGN KEY (SupplierKey)
REFERENCES Dim_Supplier(SupplierKey);
GO


-- Fact_Procurement

ALTER TABLE Fact_Procurement
ADD CONSTRAINT FK_FactProcurement_Date
FOREIGN KEY (DateKey)
REFERENCES Dim_Date(DateKey);
GO

ALTER TABLE Fact_Procurement
ADD CONSTRAINT FK_FactProcurement_Supplier
FOREIGN KEY (SupplierKey)
REFERENCES Dim_Supplier(SupplierKey);
GO

ALTER TABLE Fact_Procurement
ADD CONSTRAINT FK_FactProcurement_Product
FOREIGN KEY (ProductKey)
REFERENCES Dim_Product(ProductKey);
GO

ALTER TABLE Fact_Procurement
ADD CONSTRAINT FK_FactProcurement_Plant
FOREIGN KEY (PlantKey)
REFERENCES Dim_Plant(PlantKey);
GO


-- Fact_Quality

ALTER TABLE Fact_Quality
ADD CONSTRAINT FK_FactQuality_Date
FOREIGN KEY (DateKey)
REFERENCES Dim_Date(DateKey);
GO

ALTER TABLE Fact_Quality
ADD CONSTRAINT FK_FactQuality_Product
FOREIGN KEY (ProductKey)
REFERENCES Dim_Product(ProductKey);
GO

ALTER TABLE Fact_Quality
ADD CONSTRAINT FK_FactQuality_Machine
FOREIGN KEY (MachineKey)
REFERENCES Dim_Machine(MachineKey);
GO

ALTER TABLE Fact_Quality
ADD CONSTRAINT FK_FactQuality_Employee
FOREIGN KEY (EmployeeKey)
REFERENCES Dim_Employee(EmployeeKey);
GO

ALTER TABLE Fact_Quality
ADD CONSTRAINT FK_FactQuality_Shift
FOREIGN KEY (ShiftKey)
REFERENCES Dim_Shift(ShiftKey);
GO

ALTER TABLE Fact_Quality
ADD CONSTRAINT FK_FactQuality_Plant
FOREIGN KEY (PlantKey)
REFERENCES Dim_Plant(PlantKey);
GO


-- Fact_Maintenance

ALTER TABLE Fact_Maintenance
ADD CONSTRAINT FK_FactMaintenance_Date
FOREIGN KEY (DateKey)
REFERENCES Dim_Date(DateKey);
GO

ALTER TABLE Fact_Maintenance
ADD CONSTRAINT FK_FactMaintenance_Machine
FOREIGN KEY (MachineKey)
REFERENCES Dim_Machine(MachineKey);
GO

ALTER TABLE Fact_Maintenance
ADD CONSTRAINT FK_FactMaintenance_Employee
FOREIGN KEY (EmployeeKey)
REFERENCES Dim_Employee(EmployeeKey);
GO

ALTER TABLE Fact_Maintenance
ADD CONSTRAINT FK_FactMaintenance_Plant
FOREIGN KEY (PlantKey)
REFERENCES Dim_Plant(PlantKey);
GO


SELECT
    fk.name AS ForeignKeyName,
    OBJECT_NAME(fk.parent_object_id) AS FactTable,
    OBJECT_NAME(fk.referenced_object_id) AS DimensionTable
FROM sys.foreign_keys fk
ORDER BY FactTable, ForeignKeyName;