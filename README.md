📊 Adventure Works Sales Analysis 

🧭  This project presents an end-to-end analysis of Adventure Works sales data to understand sales trends, customer behavior, and product performance.

→ It covers the complete analytics process:

•  Data Extraction → Cleaning → Modeling → Visualization → Insights

•  The project includes two main dashboards:

•  Sales Overview Dashboard

•  Product Analysis Dashboard

🎯 2. Objective

•  Integrate and transform sales data (union, lookups for product, customer, pricing)

•  Create a complete date dimension from Order Date (Year, Month, Quarter, Financial periods, Weekday)

•  Calculate key metrics: Sales Amount, Production Cost, and Profit

•  Perform data analysis using pivot tables and charts (Yearly, Monthly, Quarterly trends)

•  Develop visualizations (bar, line, pie, and combo charts) for performance tracking

•  Analyze performance across products, customers, and regions

•  Build interactive dashboards using Power BI, Tableau, and Microsoft Excel

• Extract and manage data using MySQL to generate actionable insights

📂 3. Datasets Used 

<img width="769" height="348" alt="Tables 1" src="https://github.com/user-attachments/assets/3a5ef2b6-9066-46a3-bab7-e3f903027e63" />

🛠️ Tools & Technologies Used

• Microsoft Excel – Data Cleaning, Transformation, Pivot Tables

• MySQL – Data Querying, Joins, Aggregations

• Power BI – Data Modeling, DAX, Dashboard 

• Tableau – Advanced Visualization & Dashboard Creation

🪄  Step-by-Step Process (ETL to Dashboard)

🔹 Step 1: Data Extraction (MySQL)

•	Extracted structured data using SQL queries 

•	Performed joins between fact and dimension tables 

•	Created clean datasets for analysis 

🔹 Step 2: Data Cleaning (Excel + Power Query)

•	Removed duplicates and null values 

•	Standardized date, currency, and categorical fields 

•	Fixed inconsistent product/category naming 

•	Created derived columns: 

o	Profit = Sales – Cost

o	Profit Margin %

🔹 Step 3: Data Modeling (Power BI / Tableau)

•	Implemented Star Schema Model 

•	Established relationships between:

o	Fact → Dimension tables 

•	Ensured data integrity using keys 

🗂️ Data Modeling

<img width="1841" height="751" alt="Data Modelling" src="https://github.com/user-attachments/assets/b54868ef-766a-4857-86d0-7bfcc94390e4" />


🎯 Key KPIs

💰 Total Sales: 29M

📈 Total Profit: 12M

💸 Total Cost: 17M

👥 Total Customers: 18K

📦 Total Quantity Sold: 60K

📊 Profit Margin: 41%

👉 Insights

✅ Strong Profitability (41%)

 o Indicates efficient cost control and a healthy business model.

✅ High Customer Base (18K)

 o Reflects strong market presence and customer reach.

📊 Sales Dashboard

<img width="1622" height="694" alt="Sales" src="https://github.com/user-attachments/assets/a6849e05-df04-49d3-a720-349068235ff5" />

📊 Sales Dashboard Insights

📈 Revenue Trend Analysis (Sales vs Cost Trend Chart)

 • Sales peaked significantly around 2013, indicating a period of strong market performance.

 •  A sharp decline after the peak suggests possible seasonality, market saturation, or external economic factors.

🎯 Insight: 

o Monitoring cost alongside sales highlights profit pressure zones and helps optimize pricing strategies.

👥 Top Customers Contribution (Top 5 Customers by Sales Chart)

•  A small group of customers contributes a large portion of total revenue.

•  Sales distribution is highly concentrated among key customers.

🎯 Insight: 

o Focus on customer retention, loyalty programs, and personalized offers for high-value clients to maximize revenue.

🌍 Regional Performance (Top 5 Sales by Region Chart)

•  Australia and Southwest regions generate the highest sales revenue.

•   Germany and United Kingdom show comparatively lower performance.

🎯 Insight:

o Invest more in high-performing regions to scale growth

Apply targeted marketing strategies to improve underperforming regions

📅 Sales Trend Analysis (Monthly, Quarterly & Yearly Trend Charts)

📊  Monthly Trend:

• Shows consistent growth with minor fluctuations

• Highlights seasonal demand patterns

📊 Quarterly Trend:

• Q3 and Q4 contribute higher sales compared to Q1 & Q2

• Indicates strong performance during peak business periods

📊 Yearly Trend:

• Demonstrates steady long-term growth, with peak around 2013

🎯 Insight:

o Enables accurate forecasting & demand planning

o Helps align marketing campaigns with high-performing quarters

o Supports inventory and sales strategy optimization

📦 Product Dashboard

<img width="1612" height="706" alt="Product Analysis" src="https://github.com/user-attachments/assets/aa4881c6-9f91-4f84-9a72-121e55cc1941" />

🏆 Top Products by Sales (Top 10 Products by Sales Chart)

• Products like Mountain-200 series generate the highest sales.

• Sales are concentrated among a few top-performing products.

🎯 Insight:

o Indicates strong product-market fit

o Focus on inventory & promotion of high-demand products

💰 Top Products by Profit (Top 10 Products by Profit Chart)

•  High-selling products also contribute significantly to profit.

• Some products generate higher profit margins despite moderate sales.

🎯 Insight:

o Helps identify high-margin products

o Supports pricing and profitability optimization

📊 Sales by Category (Category-wise Sales Chart)

• Bikes category contributes the majority of total sales.

• Accessories and Clothing contribute smaller portions.

🎯 Insight:

o Bikes are the primary revenue driver
o Opportunity to grow Accessories & Clothing segments
📦 Sales by Subcategory (Subcategory Performance Chart)

•  Road Bikes and Mountain Bikes dominate sales.
•  Other subcategories show relatively lower contribution.

🎯 Insight:

o Focus on top-performing subcategories for growth

o Improve marketing for low-performing segments

🎨 Product Preference by Color (Color-wise Sales Chart)

• Black and Red products are most preferred by customers.

•  Other colors show lower demand.

🎯 Insight:

o Helps in inventory planning & production decisions

o Align product availability with customer preferences

📈 Product Performance Trend (Product Sales Trend Chart)

• Product sales show consistent growth over time with minor fluctuations.

• Peak periods align with overall sales trends.

🎯 Insight:

o Helps identify high-demand periods

o Supports production and supply chain planning

🚀 Final Insights & Recommendations

📊 Sales Dashboard:

• Revenue is driven by top regions (Australia, Southwest) and peak quarters (Q3 & Q4)

• Sales show steady growth with seasonal fluctuations

• A few high-value customers contribute major revenue

📦 Product Dashboard:

• Bikes category & top products generate maximum sales

• Some products have high sales but low profit, while others offer high-margin opportunities

• Customer preference is higher for specific colors and subcategories

📌 Recommendations

💰 Optimize pricing & cost for low-profit products

📌 Recommendations

o Focus more on top-performing products and regions to maximize revenue

o Improve low-performing regions and products with better marketing strategies

o Increase profit by optimizing pricing and reducing costs

o Retain high-value customers through loyalty programs

o Plan sales and inventory based on high-demand quarters (Q3 & Q4)
