# 🧮 DAX & Measures

DAX measures were created to calculate key operational and business metrics.Examples include:

```DAX

##Total Shipments = DISTINCTCOUNT(Fact_Shipment[ShipmentID]) 
Counts the number of unique shipments.

##Total Units Shipped = SUM(Fact_Shipment[UnitsShipped]) 
Calculates the total number of units shipped.

##Total Shipping Cost = SUM(Fact_Shipment[ShippingCost]) 
Calculates total shipping expenditure.

##On-Time Delivery % =DIVIDE([On-Time Shipments],[Total Shipments]) 
Calculates the percentage of shipments delivered on time.

##Total Returns = DISTINCTCOUNT(Fact_Return[ReturnID]) 
Counts unique return transactions.

##Return Rate = DIVIDE([Total Returned Quantity],[Total Units Shipped]) 
Measures returned units as a proportion of shipped units.

Additional measures were created for shipping costs, delivery performance, returned quantities, refunds, customers, products and operational analysis.
