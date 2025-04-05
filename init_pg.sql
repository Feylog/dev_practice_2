CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary INT
);

INSERT INTO employees (name, position, salary) VALUES
('Alice', 'Engineer', 60000),
('Bob', 'Manager', 75000),
('Carol', 'Analyst', 50000);