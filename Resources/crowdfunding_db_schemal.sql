-- SCHEMA: crowdfunding_db_schema

DROP SCHEMA IF EXISTS crowdfunding_db_schema ;

CREATE SCHEMA IF NOT EXISTS crowdfunding_db_schema
    AUTHORIZATION postgres;
	

-- Create the categories table
CREATE TABLE categories (
    category_id VARCHAR(5) PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);


-- Create the subcategories table
CREATE TABLE subcategories (
    subcategory_id VARCHAR(7) PRIMARY KEY,
    subcategory_name VARCHAR(50) NOT NULL
);

-- Create the campaigns table
CREATE TABLE campaigns (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR(255),
    description TEXT,
    goal INT,
    pledged INT,
    outcome VARCHAR(50),
    backers_count INT,
    country VARCHAR(2),
    currency VARCHAR(3),
    launched_date TIMESTAMP,
    end_date TIMESTAMP,
    category_id VARCHAR(5) REFERENCES categories(category_id),
    subcategory_id VARCHAR(7) REFERENCES subcategories(subcategory_id)
);

-- Create the contacts table
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255)
);


