# DSR-200174 Fall 2022

## Storing and Retrieving Data – project

### Project Overview

- **Final Deliverables:**
    - A report that contains:
        1. Cover page with the **names of the team members and student numbers**, 
        2. One-page description of the fictitious business process.
        3. A figure with the ERD. The names of the entities and its attributes must be visible.
    - One single SQL script to recreate the database and the existing data on it.
    - One SQL script with the queries from literal F, including a comment about the efficiency of each query
        
        (interpretation of the query execution plan).
        
- **NOTES:**
    - Deliveries is via Moodle, not via email. Only one group member should make the submission.
    - For every day delayed in the delivery you will be penalised 1 point (up to 5).
    - A reference solution for this project will not be available.
    - Defence is mandatory, missing the defence will have a penalisation of 2 points to the team. However,
    - not all members need to be present. At least one member must be present.
    - All feedback will be provided during the defence, **no additional feedback will be provided after defence.**
- **Description**
    
    > Think about any commercial business process of a product or service that needs a relational database to work (e.g., online shops, booking systems, food delivery apps, restaurant management, etc).
    > 
- **Proposed work**
    
    High-level overview of what we're building and why we think it'll solve the problem.
    
    1. Design and create an ERD in MySQL workbench. Do not forget to consider the three normal forms, when you design your database model. The names of the entities and its attributes must be visible in the ERD. **Your ERD should not have less than 8 tables**.
    2. Create two triggers: 
        1. One for updates (you can choose any updating process, for example, if a product is sold, the trigger may update the available stock of products). 
        2. Another to inserts a row in a “log” table (your ERD should include a log table). For defence, you should have ready the scripts to demonstrate that the trigger works.
    3. Create a physical relational database based on your ERD.
    4. Insert some data into you newly created database (20 or 30 rows of transactions would be enough). Make sure that you have transactions that involve **at least 2 consecutive years**. If you want to add more than just a few rows, feel free to look for openly available dataset and/or generate random data.
    5. Using MySQL, write the queries to retrieve the following information:
        1.  List all the customer’s names, dates, and products or service used/booked/rented/bought by these customers in a range of two dates.
        2. List the best three customers/products/services/places (you are free to define the criteria for what means “best”)
        3. Get the average amount of sales/bookings/rents/deliveries for a period that involves 2 or more years, as in the following example. This query **only returns one record**:
        4. Get the total sales/bookings/rents/deliveries by geographical location (city/country).
        5. List all the locations where products/services were sold, and the product has customer’s ratings (Yes, your ERD must consider that customers can give ratings).
    6. Your business process includes the generation of an INVOICE (the invoice in next page is just an example). Create two views to recreate the information on the INVOICE, one view for the head and totals, one view for the details.