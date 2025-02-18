# README.md

## Database Documentation

### Overview

This database system manages customers, products, orders, and rooms. It includes a relational schema, SQL queries, views, stored procedures, and functions to facilitate operations like retrieving order details, updating order statuses, and managing product availability.

### Database Schema

The database schema defines the structure of the tables and their relationships. Key tables include:

- **Customer**: Stores customer details (ID, Name, Email, Role, etc.).
- **Product**: Contains product details (ID, Name, Category, Price, Status, etc.).
- **Order**: Holds order-related information (ID, Note, Status, Date, Customer ID, Room ID).
- **Room**: Manages room details (ID, Number).
- **Order\_Products**: Links orders to products (Order ID, Product ID, Quantity).
- **Category**: Categorizes products (ID, Name).

### SQL Queries

This database includes SQL views, stored procedures, and functions that help retrieve and manipulate data efficiently. Key SQL elements:

#### **Views**

- `order_amount`: Retrieves total price of orders on a given date.
- `user_total_amount`: Calculates total order amounts for each user.
- `order_proccssings`: Displays processing orders with user details.

#### **Stored Procedures**

- `GetOrderDetails(order_id INT)`: Fetches product details for a specific order.
- `delivery(order_id INT)`: Updates an order's status to "Delivering".
- `Prodcut_Status(Pro_ID INT)`: Updates a product's status to "Not Available".
- `Prodcut_Status_A(Pro_ID INT)`: Updates a product's status to "Available".

#### **Functions**

- `get_room(order_id INT)`: Returns the room number associated with a given order.

### Setup and Usage

1. **Database Restoration**:

   - Restore the database using the provided SQL backup in your SQL management system.

2. **Running Queries**:

   - Execute the queries to create views, procedures, and functions.

3. **Modifying Data**:

   - Use stored procedures to update product availability and order status.

### Conclusion

This database system streamlines order management, customer tracking, and product availability. The provided SQL scripts enhance functionality, making it efficient to retrieve and update data as needed.

