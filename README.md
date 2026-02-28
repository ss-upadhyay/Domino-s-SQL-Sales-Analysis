# Domino-s-SQL-Sales-Analysis CASE STUDY

Project Overview:
This project involves exploratory data analysis of a multi-table Domino’s pizza sales dataset using SQL. I aimed to derive meaningful business insights into sales performance, customer ordering behaviour, revenue trends, and product distribution.

The dataset consists of the following relational tables-
1. orders
2. order_details
3. pizzas
4. pizza_types
The analysis was performed using MySQL.

SQL Concepts Applied:
- SELECT statements
- INNER JOIN (multi-table joins)
- GROUP BY
- ORDER BY
- Aggregation functions (SUM, COUNT, AVG)
- Subqueries
- Window functions (SUM, OVER)
- Revenue calculation
- Percentage contribution analysis

Business Questions Solved:
1. What is the total number of orders placed?
2. What are the top 5 most ordered pizza types?
3. What is the total quantity ordered per pizza category?
4. What is the category-wise distribution of pizzas?
5. What is the average number of pizzas ordered per day?
6. What percentage does each pizza type contribute to total revenue?
7. How does cumulative revenue grow over time?
8. What is the most commonly ordered pizza size?
9. Which pizza is the highest priced?
10. What is the total revenue generated?
11. What is the hourly distribution of orders?

Key Insights Derived:
• Large-sized pizzas are the most frequently ordered, indicating a strong customer preference for larger portions.
• The Classic category contributes significantly to total sales volume, making it a core revenue driver.
• A small number of pizza types account for a large percentage of total revenue, reflecting a Pareto distribution (80/20 rule).
• Peak ordering hours occur during lunch and evening timeframes, suggesting high demand during standard meal periods.
• Revenue shows consistent cumulative growth over time, indicating a stable sales performance.
• Certain premium pizzas contribute disproportionately to revenue despite lower order frequency.

Revenue Analysis:
Total revenue was calculated by multiplying quantity by price across order details and aggregating results across the dataset.
Cumulative revenue analysis was performed using SQL window functions to observe revenue growth trends over time.

Repository Structure:
Dominos-SQL-Sales-Analysis/
│
├── dominos_analysis.sql
├── data/
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
└── README.md

Conclusion:
This project demonstrates the practical application of SQL in solving real-world business problems using relational datasets. It highlights the ability to-
- Work with normalised databases
- Perform multi-table joins
- Generate revenue-based insights
- Translate raw data into business intelligence
