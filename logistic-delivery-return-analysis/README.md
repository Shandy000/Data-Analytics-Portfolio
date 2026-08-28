# 🚚 Logistics, Delivery & Return Analysis

## 📊 Power BI Portfolio Project

An end-to-end Power BI analytics project analysing shipment performance, delivery efficiency, shipping costs, customer activity and product returns.

The project demonstrates the complete data analytics workflow:

**Data Cleaning → Data Modelling → DAX → Data Visualisation → Business Insights**

---

## 🎯 Business Objective

The objective of this project was to analyse logistics and delivery operations and identify patterns across:

- Overall shipment performance
- Shipment volume and shipping costs
- Delivery efficiency
- Warehouse and driver performance
- Product return activity
- Return reasons and refund impact
- Customer shipment and return behaviour

The dashboard was designed from a stakeholder perspective, focusing on actionable KPIs and clear visual communication rather than simply displaying raw data.

---

## 🛠 Tools & Technologies

- Microsoft Power BI
- Power Query
- DAX
- Data Modelling
- Star Schema Design
- Data Visualisation
- GitHub

---

## 🔄 Data Analytics Process

### 1. Data Cleaning — Power Query

The dataset was imported into Power BI and prepared using Power Query before modelling and analysis.

Key preparation steps included:

- Validated data types across all tables
- Reviewed and standardised column names and table structures
- Promoted headers where required
- Checked for data quality and consistency issues
- Validated date and numeric fields
- Prepared fact and dimension tables for relational modelling

After preparation, the cleaned tables were loaded into the Power BI data model for analysis.

### 2. Data Modelling

A star-schema-style data model was created to support analysis across shipments, returns, customers, products, warehouses and drivers.

**Dimension Tables**
- Dim_Customer
- Dim_Product
- Dim_Warehouse
- Dim_Driver
- Dim_Date

**Fact Tables**
- Fact_Shipment
- Fact_Return

**Key Relationships**
- Customer → Shipment
- Customer → Return
- Product → Shipment
- Product → Return
- Warehouse → Shipment
- Driver → Shipment
- Date → Shipment
- Date → Return

The model also includes separate shipment order-date and delivery-date logic to support date-based analysis.

![Logistics Data Model](Documentation/data_model.png?raw=true)

---

## 🧮 DAX & Measures

Reusable DAX measures were created to calculate key logistics, delivery, return and customer performance metrics.

Key measures included:

- Total Shipments
- Units Shipped
- Total Shipping Cost
- Average Shipping Cost
- On-Time Delivery %
- Late Shipments
- Average Distance Miles
- Total Returns
- Returned Units
- Return Rate
- Total Refund Amount
- Average Refund Amount
- Total Customers
- Total Products

These measures were used across KPI cards, charts, tables and drill-through analysis to provide consistent calculations throughout the report.

📄 [View DAX Measures](DAX/measures.md)

---

## 📈 Dashboard Pages

The Power BI report contains five interactive pages covering executive KPIs, delivery operations, returns, customer performance and transaction-level detail.

### 1. Executive Overview

Provides a high-level view of overall logistics performance.

![Executive Overview](PowerBI%20Dashboard/Executive%20Overview.png)

**Key KPIs**
- 130 total shipments
- 856 units shipped
- £6.6K total shipping cost
- 87.7% on-time delivery
- 34 returns
- 7.6% return rate

**Key Findings**
- The majority of shipments were delivered on time, although 12.3% were not.
- Shipment activity was highest in February before declining in the following months.
- Shipment volume was relatively balanced across warehouses.
- Home recorded the highest number of returns among the product categories shown.

---

### 2. Delivery & Logistics Performance

Focuses on delivery efficiency, shipping costs, warehouses, drivers and delivery distance.

![Delivery and Logistics Performance](PowerBI%20Dashboard/Delivery%20%26%20logistics%20performance.png)

**Key Findings**
- Overall on-time delivery was 87.7%, with 16 late shipments.
- Average delivery distance was approximately 208.3 miles.
- Delivery distance and shipping cost showed a strong positive relationship, with longer-distance shipments generally costing more.
- On-time delivery performance varied between drivers.
- Total shipping cost was distributed fairly evenly across the three warehouses.

---

### 3. Returns & Product Performance

Analyses product returns, refund impact and return reasons.

![Returns and Product Performance](PowerBI%20Dashboard/Returns%20%26%20product%20performance.png)

**Key KPIs**
- 34 total returns
- 65 returned units
- Approximately £3.4K in refunds
- 7.6% overall return rate

**Key Findings**
- Wrong Item was the most frequent return reason, accounting for 11 returns.
- Late Delivery was the second-largest return reason with 7 returns.
- Home recorded the highest returned-unit volume among product categories, with 23 units.
- Electric Kettle had the highest returned quantity among individual products, with 11 units.
- Return activity was highest during February and March.

---

### 4. Customer & Operational Deep Dive

Provides customer-level analysis of shipment activity, shipping costs and return behaviour.

![Customer and Operational Deep Dive](PowerBI%20Dashboard/Customer%20%26%20operational%20Deep%20Dive.png)

**Key KPIs**
- 18 customers
- Average 6.6 units per shipment
- Approximately £50.4 average shipping cost

**Key Findings**
- Shipment volume varied across customers.
- Return rates differed considerably between customers.
- Customer-level comparisons help identify accounts with unusually high return activity for further investigation.
- This page allows operational performance to be examined beyond overall company-level KPIs.

---

### 5. Customer Detail

A drill-through page provides transaction-level information for individual customers.

![Customer Detail](PowerBI%20Dashboard/Customer%20Detail.png)

The page allows users to move from aggregated customer performance to individual shipment and return records, supporting more detailed investigation of customer behaviour.

---

## ⚡ Power BI Features Demonstrated

- Power Query for data preparation and transformation
- Star-schema-style data modelling
- Fact and dimension table relationships
- DAX measures for operational KPIs
- KPI cards
- Line, bar, column, donut and scatter charts
- Tables and matrices
- Conditional formatting
- Interactive slicers
- Page navigation
- Drill-through analysis

---

## ❓ Key Analytical Questions

The analysis was designed to answer the following business questions:

- What is the overall shipment volume and shipping cost?
- What percentage of shipments are delivered on time?
- How does delivery performance vary across warehouses and drivers?
- What is the relationship between delivery distance and shipping cost?
- Which product categories and products generate the most returns?
- What are the most common reasons for product returns?
- What is the financial impact of refunds?
- Which customers generate the highest shipment activity?
- Which customers show higher levels of return activity?

---

## 💡 Key Business Insights

- **Delivery performance remained strong overall:** 87.7% of shipments were delivered on time, although 16 shipments were late.
- **Distance is an important logistics cost factor:** longer delivery distances generally corresponded with higher shipping costs.
- **Driver performance varied:** on-time delivery performance ranged from 82.6% to 100% across the drivers analysed.
- **Returns were concentrated around specific issues:** Wrong Item was the most frequent return reason, followed by Late Delivery.
- **Home products generated the highest return volume:** the Home category recorded 23 returned units.
- **Electric Kettle recorded the highest individual product return quantity:** 11 units were returned.
- **Returns had a measurable financial impact:** approximately £3.4K was issued in refunds.
- **Customer return behaviour varied:** customer-level return rates differed considerably, highlighting accounts that may warrant further investigation.

---

## 🎯 Portfolio Skills Demonstrated

- Data cleaning and preparation
- Data modelling
- Star schema design
- DAX measure development
- KPI design and reporting
- Logistics and operational analysis
- Return and customer analysis
- Data visualisation
- Dashboard design
- Drill-through analysis
- Business insight generation
