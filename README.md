# My DataCamp Certification Project

## Focusing on Product Data Cleaning and Transformation
This repository contains a SQL script designed to clean and transform a product dataset. The script performs several key operations, including replacing null values, converting data types, and calculating median values for specific columns.

### Overview
The SQL script performs the following operations:

Calculate Median Values:
Created a Common Table Expression (CTE) to obtain median values for weight and price, rounded to 2 decimal places.
Data Cleaning and Transformation:

Replaced null values in product_type with 'Unknown'.
Replaced null values in brand with 'Unknown' and removed hyphens using regular expressions.
Converted string values in the weight column to decimal values.
Replaced null values in price with the median price obtained from the CTE.
Replaced null values in average_units_sold with '0'.
Replaced null values in year_added with '2022'.
Replaced null values in stock_location with 'Unknown' and capitalized the text.

### How to Use
Clone the repository.
Run the SQL script on your database containing the products table.
The script will clean and transform the data, replacing null values and converting data types as specified.
### Requirements
A database containing a products table with the following columns: product_id, product_type, brand, weight, price, average_units_sold, year_added, stock_location.
SQL database system that supports CTEs and the functions used in the script (e.g., PostgreSQL, MySQL).

### Contributions
Contributions are welcome! Please open an issue or submit a pull request.

