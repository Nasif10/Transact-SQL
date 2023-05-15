CREATE TABLE #Person (
    Id int,
    name VARCHAR(MAX),
    age int
);

INSERT INTO #Person VALUES (1, 'John', 'johndoe@example.com'), (2, 'Alice', 'alicejohnson@example.com');

SELECT * FROM #Person