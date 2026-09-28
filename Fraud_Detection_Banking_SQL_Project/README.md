# Banking Fraud Detection SQL Project

## Project
Fraud Detection in Banking Transactions

## Database
MySQL

## Tables
1. customers - 1000 rows
2. branches - 1000 rows
3. accounts - 1000 rows
4. cards - 1000 rows
5. beneficiaries - 1000 rows
6. transactions - 1000 rows
7. loans - 1000 rows
8. login_activity - 1000 rows

## Why this project
This project is designed to practice:
- SELECT, WHERE, ORDER BY, GROUP BY, HAVING
- INNER/LEFT/SELF joins
- Subqueries and correlated subqueries
- CTEs
- Window functions and ranking
- CASE expressions
- Date/time analysis
- Fraud and anomaly detection logic
- Views
- Stored procedures
- Triggers
- Indexing and query optimization

## Files
- 01_schema.sql -> creates the database and all 8 tables
- 02_insert_data.sql -> inserts all 8000 rows
- *.csv -> individual datasets, exactly 1000 rows per table

## Suggested workflow
1. Create the database using 01_schema.sql.
2. Load 02_insert_data.sql in MySQL Workbench.
3. Verify every table using SELECT COUNT(*).
4. Start with basic SQL questions.
5. Move to JOIN and GROUP BY questions.
6. Practice CTEs and window functions.
7. Build fraud detection queries.
8. Create views for fraud dashboards.
9. Add stored procedures and triggers.
10. Prepare a final README and GitHub repository.

## Important note
The fraud fields are synthetic training data. They are intended for SQL practice, not real banking or financial decision-making.
