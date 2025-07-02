--Which product category had the highest sales? 
SELECT 
    [Product_Category], 
    SUM([Sales]) AS Total_Sales
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC;

-- What are the Top 3 and Bottom 3 regions in terms of sales?
--For Top
SELECT 
    [Region], 
    SUM([Sales]) AS Total_Sales
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Region]
ORDER BY 
    Total_Sales DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

--For Bottom
SELECT 
    [Region], 
    SUM([Sales]) AS Total_Sales
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Region]
ORDER BY 
    Total_Sales ASC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

--What were the total sales of appliances in Ontario? 
SELECT 
    SUM([Sales]) AS Appliance_Sales_Ontario
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    [Product_Category] = 'Office Supplies'
    AND [Product_Sub_Category] = 'Appliances'
    AND [Province] = 'Ontario';

--Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
SELECT TOP 10 
    [Customer_Name], 
    SUM([Sales]) AS Total_Sales
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales ASC;

--KMS incurred the most shipping cost using which shipping method?
SELECT 
    [Ship_Mode], 
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Ship_Mode]
ORDER BY 
    Total_Shipping_Cost DESC;

	--Who are the most valuable customers, and what products or services do they typically purchase? 
SELECT 
    [Customer_Name],
    SUM([Sales]) AS Total_Sales,
    COUNT(DISTINCT [Product_Name]) AS Unique_Products
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;
--
SELECT 
    [Customer_Name],
    [Product_Category],
    SUM([Sales]) AS Category_Sales
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    [Customer_Name] = 'TOP_CUSTOMER_NAME_HERE'
GROUP BY 
   [Customer_Name] , [Product_Category]
ORDER BY 
    Category_Sales DESC;

	-- Which small business customer had the highest sales? 
	SELECT 
    [Customer_Name], 
    SUM([Sales]) AS Total_Sales
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    [Customer_Segment] = 'Small Business'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;
	
-- Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT 
    [Customer_Name], 
    COUNT(DISTINCT [Order_ID]) AS Number_Of_Orders
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    [Customer_Segment] = 'Corporate'
    AND YEAR([Order_Date]) BETWEEN 2009 AND 2012
GROUP BY 
    [Customer_Name]
ORDER BY 
    Number_Of_Orders DESC;

--Which consumer customer was the most profitable one?
SELECT 
    [Customer_Name], 
    SUM([Profit]) AS Total_Profit
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    [Customer_Segment] = 'Consumer'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Profit DESC;

--Which customer returned items, and what segment do they belong to? 
SELECT 
    [Customer_Name], 
    [Customer_Segment],
    SUM([Profit]) AS Net_Profit
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Customer_Name], [Customer_Segment]
HAVING 
    SUM([Profit]) < 0;

--If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer 
SELECT 
    [Order_Priority],
    [Ship_Mode],
    COUNT(*) AS Total_Orders,
    SUM([Shipping_Cost]) AS Total_Shipping_Cost,
    AVG([Delivery_Days]) AS Avg_Delivery_Days
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    [Order_Priority], [Ship_Mode]
ORDER BY 
    [Order_Priority], Total_Shipping_Cost DESC;
