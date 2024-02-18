-- Create a sample table
CREATE TABLE SampleTable (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100)
);

-- Insert some sample data into the table
INSERT INTO SampleTable (ID, Name)
VALUES (1, 'John'),
       (2, 'Jane'),
       (3, 'Alice');

