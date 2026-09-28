"# SQL-Besant-Technologies" 
Banking Fraud Detection System

A SQL-based Banking Fraud Detection System developed using MySQL to manage banking data and identify suspicious financial and login activities. This project demonstrates relational database management, SQL analytics, fraud detection queries, reporting, stored procedures, triggers, and database optimization.

Project Overview

The Banking Fraud Detection System is designed to simulate real-world banking operations and fraud analysis. The project focuses on:

Database Design
Relational Database Management
SQL Query Development
Fraud Detection & Analysis
Transaction Analytics
Customer & Account Analysis
Reporting & Insights Generation 

The project contains 8 relational tables with 1,000 records in each table, giving a total of 8,000 synthetic records.

This project is suitable for showcasing SQL, Database Management, Data Analytics, and Fraud Detection skills for internships, placements, and portfolio projects.

Features
Customer Management
Store customer personal details
Maintain customer contact information
Track city and state
Maintain customer registration date
Branch Management
Store branch details
Maintain branch code and branch name
Track branch location
Classify branches by type
Account Management
Maintain customer bank accounts
Link accounts with customers and branches
Track account type
Maintain account balance
Track account status
Card Management
Store debit and credit card details
Track card issue and expiry dates
Maintain card status
Track daily transaction limits
Beneficiary Management
Store beneficiary details
Link beneficiaries with bank accounts
Maintain beneficiary bank details
Track beneficiary account and IFSC information
Transaction Management
Store banking transaction records
Track transaction type and channel
Maintain transaction amount
Track merchant and transaction location
Store transaction status
Identify fraudulent transactions
Maintain fraud reasons
Loan Management
Store customer loan details
Track loan type
Maintain principal and interest rate
Calculate and store EMI information
Track loan tenure
Monitor loan status
Login Activity Management
Track customer login activities
Store device and channel information
Maintain IP address and location
Track failed login attempts
Identify unusual login activities
Technologies Used
Technology	Description
MySQL	Database Management
SQL	Query Language
MySQL Workbench	Database Modeling & Query Execution
Database Tables
Table Name	Description
customers	Customer information
branches	Bank branch details
accounts	Customer bank account information
cards	Debit and credit card details
beneficiaries	Beneficiary information
transactions	Banking transaction records
loans	Loan and EMI information
login_activity	Customer login and security activity
Entity Relationship Highlights
One customer can have an account
Accounts are linked to customers and branches
One account can have multiple cards
One account can have multiple beneficiaries
One account can have multiple transactions
Transactions can be associated with beneficiaries
Customers can have loan records
Customers can have multiple login activity records
Fraudulent transactions are identified using transaction attributes
Unusual login activities can be analyzed along with transaction activity
SQL Concepts Used
SELECT
WHERE
ORDER BY
LIMIT
DISTINCT
Aggregate Functions
GROUP BY
HAVING
INNER JOIN
LEFT JOIN
Subqueries
CASE Statements
CTEs
Window Functions
RANK()
ROW_NUMBER()
Views
Stored Procedures
Triggers
Constraints
Indexes
Fraud Detection Queries
Sample Analytical Queries
1. High-Value Suspicious Transactions
SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    channel,
    amount,
    location,
    status
FROM transactions
WHERE amount > 180000
   OR is_fraud = 1;
2. Fraud Count by Transaction Type
SELECT
    transaction_type,
    COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY transaction_type
ORDER BY fraud_count DESC;
3. Customer Transaction Analysis
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    t.transaction_id,
    t.transaction_type,
    t.amount
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id;
4. Unusual Login Activity
SELECT
    customer_id,
    login_datetime,
    device_type,
    channel,
    city,
    failed_attempts
FROM login_activity
WHERE is_unusual = 1;
Advanced SQL (Stored Procedure, Triggers)
1. Suspicious Transactions
SELECT
    t.transaction_id,
    t.account_id,
    a.balance AS account_balance,
    t.amount AS transaction_amount,
    t.transaction_type,
    t.transaction_date
FROM transactions t
INNER JOIN accounts a
    ON t.account_id = a.account_id
WHERE t.amount > a.balance;
2. Fraudulent Transaction After Unusual Login
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name,
    t.transaction_id,
    t.transaction_date,
    l.login_datetime,
    t.amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
INNER JOIN login_activity l
    ON c.customer_id = l.customer_id
WHERE t.is_fraud = 1
  AND l.is_unusual = 1
  AND DATEDIFF(
        t.transaction_date,
        DATE(l.login_datetime)
      ) BETWEEN 0 AND 7;
3. Duplicate Transaction Detection
SELECT
    account_id,
    transaction_date,
    transaction_type,
    amount,
    COUNT(*) AS duplicate_count
FROM transactions
GROUP BY
    account_id,
    transaction_date,
    transaction_type,
    amount
HAVING COUNT(*) > 1;
Project Objectives
Manage banking information efficiently
Analyze customer and account data
Identify suspicious banking transactions
Detect unusual login activities
Detect possible duplicate transactions
Generate analytical reports
Demonstrate advanced SQL concepts
Improve database management and query skills
Learning Outcomes

This project helps in improving:

SQL Skills
Advanced SQL Query Writing
Database Design
Relational Database Modeling
JOIN and Subquery Knowledge
CTE and Window Function Knowledge
Fraud Detection Analysis
Stored Procedure and Trigger Knowledge
Query Optimization
Data Analytics
Future Enhancements
Power BI Banking Fraud Dashboard
Web Application Integration
Real-Time Fraud Monitoring
Machine Learning Fraud Prediction
Customer Risk Scoring
Authentication & Authorization
Automated Fraud Alerts
Real-Time Transaction Monitoring
How to Run the Project
Step 1: Install MySQL

Install:

MySQL Server
MySQL Workbench
Step 2: Create Database
CREATE DATABASE banking_fraud_detection;
USE banking_fraud_detection;
Step 3: Create Tables

Execute the provided:

01_schema.sql

This creates all 8 tables and their relationships.

Step 4: Insert Dataset

Execute:

02_insert_data.sql

The project contains 1,000 records in each table.

Step 5: Verify Records
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM branches;
SELECT COUNT(*) FROM accounts;
SELECT COUNT(*) FROM cards;
SELECT COUNT(*) FROM beneficiaries;
SELECT COUNT(*) FROM transactions;
SELECT COUNT(*) FROM loans;
SELECT COUNT(*) FROM login_activity;
Step 6: Execute SQL Queries

Run the provided SQL queries to perform:

Customer analysis
Account analysis
Transaction analysis
Fraud detection
Login activity analysis
Advanced SQL reporting
Project Structure
Banking-Fraud-Detection-SQL/
│
├── customers.csv
├── branches.csv
├── accounts.csv
├── cards.csv
├── beneficiaries.csv
├── transactions.csv
├── loans.csv
├── login_activity.csv
│
├── 01_schema.sql
├── 02_insert_data.sql
├── data_dictionary.csv
├── banking_fraud_er_diagram.png
├── Banking_Fraud_Detection_SQL_Project_Final.pdf
└── README.md
Dataset

The project uses synthetic/generated data for SQL practice and demonstration purposes.

Table	Records
customers	1,000
branches	1,000
accounts	1,000
cards	1,000
beneficiaries	1,000
transactions	1,000
loans	1,000
login_activity	1,000
Total	8,000
Author
Grishwar S V
BE Computer Science and Engineering
Interested in SQL, Data Analytics, Full Stack Development, and Backend Development
Conclusion

The Banking Fraud Detection System is a SQL-based project that demonstrates database design, relational data management, transaction analysis, and fraud detection using MySQL. The project combines 8 interconnected tables and 8,000 synthetic records to provide practical experience with SQL querying, advanced analytics, stored procedures, triggers, and reporting.

This project is suitable for academic presentations, internships, placements, GitHub portfolios, and SQL/Data Analyst roles.
