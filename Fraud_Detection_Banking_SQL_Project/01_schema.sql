
CREATE DATABASE IF NOT EXISTS banking_fraud_detection;
USE banking_fraud_detection;

DROP TABLE IF EXISTS login_activity;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS beneficiaries;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(120) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    date_of_birth DATE,
    customer_since DATE
);

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_code VARCHAR(20) UNIQUE,
    branch_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    branch_type VARCHAR(30)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_number VARCHAR(30) UNIQUE,
    account_type VARCHAR(40),
    opened_date DATE,
    balance DECIMAL(15,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    card_number VARCHAR(30) UNIQUE,
    card_type VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    status VARCHAR(20),
    daily_limit DECIMAL(12,2),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE beneficiaries (
    beneficiary_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    beneficiary_name VARCHAR(100),
    bank_name VARCHAR(80),
    beneficiary_account VARCHAR(30),
    ifsc_code VARCHAR(20),
    added_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    beneficiary_id INT NULL,
    transaction_date DATE,
    transaction_type VARCHAR(40),
    channel VARCHAR(40),
    merchant VARCHAR(100),
    amount DECIMAL(15,2),
    location VARCHAR(50),
    status VARCHAR(20),
    is_fraud TINYINT DEFAULT 0,
    fraud_reason VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries(beneficiary_id)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type VARCHAR(30),
    principal_amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    tenure_months INT,
    emi_amount DECIMAL(15,2),
    loan_start_date DATE,
    loan_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE login_activity (
    login_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    login_datetime DATETIME,
    device_type VARCHAR(30),
    channel VARCHAR(30),
    ip_address VARCHAR(45),
    city VARCHAR(50),
    failed_attempts INT,
    login_status VARCHAR(20),
    is_unusual TINYINT DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
