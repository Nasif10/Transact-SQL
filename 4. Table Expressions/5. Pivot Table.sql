-- Pivot Table

CREATE TABLE SalesData (Region VARCHAR(50), Product VARCHAR(50), Sales INT);

INSERT INTO SalesData (Region, Product, Sales) VALUES 
('East', 'A', 100), ('West', 'A', 200), ('East', 'B', 150), ('West', 'B', 300);


SELECT Product, [East], [West] FROM SalesData
PIVOT (
    SUM(Sales)
    FOR Region IN ([East], [West])
) AS PivotTable;
