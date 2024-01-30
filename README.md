# Data Analysis for Mint Classics Company's Inventory Management
Analyzing data to provide business recommendations related to inventory and potentially closing a storage facility is the goal using MySQL. Mint Classics Company's primary focus is to improve operational efficiency and boost profitability through these measures.

# Project Summary
Mint Classics Company, a renowned retailer specializing in classic model cars and vehicles, decided to explore the closure of one of their storage facilities. To ensure a well-informed decision, they sought data-driven insights on inventory management while upholding their commitment to timely customer service. 

~ The objective is to maintain a 24-hour order-to-ship cycle. As a appointed data analyst, I leveraged MySQL Workbench to delve into existing data, profitable opportunities for inventory reduction, and formulate actionable recommendations.

# Approach 
The main issue we're tackling is whether to shut down one of the current storage facilities. So, I've identified products with excess inventory, optimized warehouse usage, and adjusted pricing strategies to increase sales. Recognizing valuable customers and evaluating sales team performance will drive efficiency. Analyzing payment trends will improve cash flow management, while assessing product lines aids in portfolio optimization. 

The primary question I'll address is whether there are products in the inventory with high stock levels but low sales. By answering important questions like this, we can develop strategies to optimize the inventory of such products, potentially avoiding overstocking and improving overall operational efficiency.
1. Are there products in the inventory with high stock levels but low sales?
2. How can we optimize the inventory for products with high stock and low sales?
3. Do we need all the warehouses currently in use?
4. Which customers are driving the highest sales?
5. How does the performance of various product lines compare?
6. Which products are the most successful, and which ones need improvement or removal?
7. How many orders have exceeded the customer's credit limit, resulting in delays of more than 60 days?
8. How can we use joins across the tables to identify orders that are shipping within one day, in line with our objective of achieving next-day product delivery?

# Solution
1. Storage Facility Optimization:
   - Identify current storage locations of items.
   - Analyze the distribution of inventory across facilities.
   - Determine if rearranging items could facilitate the elimination of a warehouse.

2. Inventory-Sales Relationship:
   - Assess the correlation between inventory numbers and sales figures.
   - Evaluate if inventory counts align with demand for each item.
   - Identify any discrepancies or inefficiencies in inventory management.

3. Stagnant Inventory Identification:
   - Identify items with minimal or no movement.
   - Determine if any products are suitable candidates for discontinuation.
   -Assess the potential impact of removing certain items from the product line.


- Conducted a comprehensive review of inventory levels and storage capacity in each warehouse. Identified redundancies and underutilized facilities. Generated a report listing all warehouses and their respective 
  inventory levels. Highlighted warehouses with consistently low or inactive inventory.
-> By investigating the reasons behind the low activity, such as seasonal fluctuations, product demand shifts, or inefficiencies in inventory management. Based on the findings, consider consolidating inventory, 
   redistributing stock to other facilities, or repurposing the warehouse space.
-> Analyzed sales data to identify top-performing customers based on revenue generated and order frequency. Developed customer profiles to understand their purchasing behavior, preferences, and buying patterns.
-> Evaluated the sales performance of each product line based on metrics such as Total sales, Quantity In Stock, revenue generated and Sales to Inventory Ratio  Identified the top-selling products and for 
   underperforming product lines, conduct market research to identify potential reasons for poor sales performance, such as changing consumer preferences or competitive pressures. 






