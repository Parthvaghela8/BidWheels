-- db/migration/V1__create_table_and_insert_data.sql
 
-- Create a table called 'example_table'
CREATE TABLE trial (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    created_at DATETIME DEFAULT GETDATE()
);
 
-- Insert some initial data into 'example_table'
INSERT INTO trial (name, age, created_at) VALUES
    ('John Doe', 25, GETDATE()),
    ('Jane Smith', 30, GETDATE()),
    ('Bob Johnson', 22, GETDATE());