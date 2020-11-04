-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
-- Customer
-- -
-- CustomerID PK int
-- Name string INDEX
-- Address1 string
-- Address2 NULL string
-- Address3 NULL string
-- Order
-- -
-- OrderID PK int
-- CustomerID int FK >- Customer.CustomerID
-- TotalAmount money
-- OrderStatusID int FK >- os.OrderStatusID
-- OrderLine as ol
-- ----
-- OrderLineID PK int
-- OrderID int FK >- Order.OrderID
-- ProductID int FK >- p.ProductID
-- Quantity int
-- Product as p
-- ------------
-- ProductID PK int
-- Name varchar(200) UNIQUE
-- Price money
-- OrderStatus as os
-- ----
-- OrderStatusID PK int
-- Name UNIQUE string

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(20)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

