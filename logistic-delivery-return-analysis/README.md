# Logistics, Delivery & Return Analysis

## 📊 Power BI Portfolio Project

An end-to-end Power BI analytics project analysing shipment performance, delivery efficiency, shipping costs, customer activity and product returns.

The project demonstrates the complete data analytics workflow:

**Data Cleaning → Data Modelling → DAX → Data Visualisation → Business Insights**

---

## 🎯 Business Objective

The objective of this project was to create an interactive logistics performance dashboard that helps stakeholders understand:

- Overall shipment performance
- Shipment volume and shipping costs
- Delivery efficiency
- Warehouse and driver performance
- Product return activity
- Return reasons and refund impact
- Customer shipment and return behaviour

The dashboard was designed from a stakeholder perspective, focusing on actionable KPIs and clear visual communication rather than simply displaying raw data.

---

## 🛠️ Tools & Technologies

- Microsoft Power BI
- Power Query
- DAX
- Data Modelling
- Data Visualisation
- Star Schema
- GitHub

---

# 🔄 Data Analytics Process

## 1. Data Cleaning — Power Query

The dataset was imported into Power BI and prepared using Power Query.

Key preparation activities included:

- Checked data types across tables
- Reviewed column names and data structure
- Promoted headers where required
- Checked data quality and consistency
- Reviewed date and numeric fields
- Prepared tables for data modelling

After completing the cleaning and transformation process, the queries were applied to Power BI for modelling and analysis.

---

## 2. Data Modelling

A star-schema-style data model was created using dimension and fact tables.

### Dimension Tables

- Dim_Customer
- Dim_Product
- Dim_Warehouse
- Dim_Driver
- Dim_Date

### Fact Tables

- Fact_Shipment
- Fact_Return

The model uses relationships between dimension tables and fact tables to allow consistent filtering and analysis across the report.

Key relationships include:

- Customer → Shipment
- Customer → Return
- Product → Shipment
- Product → Return
- Warehouse → Shipment
- Driver → Shipment
- Date → Shipment
- Date → Return

The model also includes separate shipment order-date and delivery-date logic to support date-based analysis.

---
# 🧮 DAX & Measures

DAX measures were created to calculate key operational and business metrics.

---
📈 Dashboard Pages 

1. Executive Overview

Provides a high-level summary of logistics performance.

Key metrics include:

Total Shipments
Units Shipped
Shipping Cost
On-Time Delivery %
Total Returns
Return Rate

Visuals include shipment trends, warehouse performance, return categories and operational comparisons.

2. Delivery & Logistics Performance

Focuses on delivery efficiency and logistics operations.

Analysis includes:

On-Time Delivery %
Late Shipments
Average Shipping Cost
Average Distance
Warehouse delivery performance
Driver performance
Shipping Cost vs Distance
Shipment Volume vs Shipping Cost

3. Returns & Product Performance

Analyses product returns and their financial impact.

Key areas include:

Total Returns
Returned Quantity
Return Rate
Refund Amount
Average Refund Amount
Return Reasons
Product categories with highest returns
Top products by returned quantity
Return trends over time

4. Customer & Operational Deep Dive

Provides a more detailed view of customer activity.

Analysis includes:

Top customers by shipment volume
Customers with highest returned quantities
Customer performance comparison
Shipment activity
Return behaviour
Customer-level performance metrics

Conditional formatting was used to help identify stronger and weaker performance.

5. Customer Detail

A drill-through page providing detailed information for an individual customer.

The page combines:

Customer information
Shipment details
Delivery performance
Return information
Returned quantities
Return reasons
Refund amounts

This allows stakeholders to move from high-level customer performance to the underlying transaction-level details.

📊 Power BI Features Demonstrated

This project demonstrates practical use of:

Power Query
Data cleaning
Data modelling
Star schema
Relationships
DAX measures
KPI cards
Line charts
Bar charts
Column charts
Donut charts
Scatter charts
Tables and matrices
Conditional formatting
Slicers
Page navigation
Drill-through analysis

💡 Key Analytical Questions

The dashboard was designed to answer questions such as:

How many shipments were processed?
How many units were shipped?
What was the total shipping cost?
What percentage of shipments were delivered on time?
Which warehouses have the strongest delivery performance?
Which drivers have the best on-time performance?
Does shipping cost increase with delivery distance?
Which product categories generate the most returns?
What are the main reasons for returns?
Which products have the highest returned quantities?
What is the financial impact of refunds?
Which customers generate the highest shipment volumes?
Which customers have the highest return activity?

📌 Portfolio Skills Demonstrated

This project demonstrates my ability to:

Clean and prepare structured datasets
Build relational data models
Create reusable DAX measures
Analyse operational performance
Compare KPIs across different business dimensions
Identify trends and performance differences
Design interactive Power BI dashboards
Translate business questions into analytical outputs
Present data clearly for stakeholder decision-making

👩‍💻 Author
Shandy Su
Aspiring Data Analyst
