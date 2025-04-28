Hello,

in this work I present several dashboards in the Power Bi program and queries in the MS SQL Server program.

Each dashboard is contained in a separate chapter, to which the appropriate directory is assigned. Of course, you can download the Power Bi file from there, the .xlsx file ready to open in Excel, the file in the .csv form to upload it to SQL and screenshots of the dashboard and search results in the MS SQL Server program.

The "MS_SQL_Queries" is an MS SQL Server file, which contains all the queries I used in this project. You can download it and run it at your computer.

Below is a short table of contents with links to each chapter, and then there is my actual work - screenshots of dashboards, screenshots of SQL results and my explanations.

---

1. Chapter 1 - Dashboard, SQL (ALTER TABLE, SUM, COUNT, SUBQUERY, GROUP BY, HAVING)
2. Chapter 2 - Dashboard, SQL (FORMAT, ROUND, AVG, OVER, RANK, PARTITION BY, WHERE)
3. Chapter 3 - Dashboard (Decomposition tree, key influencers, Q&A, gauge), SQL (LEFT JOIN, OUTER JOIN, COALESCE, NOT NULL, CASE, WHEN)
4. Chapter 4 - DAX(SUM, AVERAGE, CALCULATE, COUNTROWS, POWER, SQRT, DIVIDE)

---

# Table of Contents
- [Table of Contents](#table-of-contents)
- [1. Chapter 1](#1-chapter-1)
- [2. Chapter 2](#2-chapter-2)
- [3. Chapter 3](#3-chapter-3)
- [4. Chapter 4](#4-chapter-4)


## **Chapter 1**

In each dashboard, I will describe what actions I have taken. The Power Bi program can be downloaded from the Microsoft website. Always check if the download is from a secure source

![Dash1](https://github.com/user-attachments/assets/54561d3b-ef13-4c00-a9d0-461d8defe870)


1. In the lower left corner we place a line chart created using Order Total and Date. Thanks to this we can see how sales looked over the month, the highest values ​​on March 3 and 7 are clearly visible

2. In the upper left corner I inserted the average number of items purchased based on region. For this we need "Order Total", "Product region" and "Order Quantity". You can see a lot of variety depending on the region, for North America the average order is 2 items, and for Asia a little over 1.

3. The pie chart shows sales values ​​based on the shipping method. We can see that air and ground shipping have similar values.

4. In the upper right corner, we create a funnel chart by inserting "Shipping method" and "Product region" into the categories, and "Sum of Order Total" into the value. By far the highest value falls on air shipping in Europe. Interestingly, the exact opposite proportions are for the type of shipping in Asia, where land shipping significantly outweighs air shipping. Just as in Europe, air shipping outweighs land shipping.

The graph in the lower right corner was to indicate whether there is a relationship between the size of the item and the shipping method in a given country. Here, too, we may be surprised - it might seem that the larger size "L" would be more often chosen by land, but we can see that in the case of this size, air is much more often chosen as a delivery method.

![SQL1](https://github.com/user-attachments/assets/71d8b56d-69af-45e5-b83f-50b3346815a8)

First, we need to modify the columns in our table because the date format is incorrect. To do this, we use ALTER TABLE and modify the columns to DATE.

Next, let's check which bikes had the most orders. These are the EnduranceElite 9000 and the FreestyleMaster 9000.

The second query returns the number of subcategories that are in the 'Road Bikes' category, into which the bikes are divided. We can see that there are 12 of them, which can be useful in future analyses.

  [Table of Contents](#table-of-contents)
## **2. Chapter 2** 

![Dash2](https://github.com/user-attachments/assets/b834fa39-2891-4c88-9a09-648153a2982b)

1. I place the KPI of the total orders and the total products in stock at the top, so that we have a good overview of the data during the entire analysis. The first is the total orders over the dates, the second is the product stock.

2. I create a pie chart to determine which bike categories contributed to the total sales. "Mountain Bikes" and "Road Bikes" stand out significantly, the smallest value is for "Kids Bikes".

3. In the pie chart settings, in the general - label tab, we set "Label contents = Percentage of category".

4. We add a chart border, in General -> Effects.

5. We create a bar chart by color, add "product color" and "order total". Blue is definitely the leading color, the least frequently chosen color is silver.

6. We add visual labels and a border.

7. From the order date and the total orders, we create a line chart to check if there is a sales trend. The highest sales were on March 7.

8. We add a clustered bar chart to show sales by region. Europe is clearly the leader.

![SQL2](https://github.com/user-attachments/assets/41351010-baec-4c22-88dc-334d0fb1b65e)

The query will work correctly, returning the total orders, average product price and product color only for the regions "Europe" and "Asia" where the average product price is greater than 1700.

The second result is TOP 5, The query will return 5 rows (largest orders), sorted by Order_Total, and additionally RANK() will assign rankings within each product color, starting from 1 for the highest value.

 [Table of Contents](#table-of-contents)
## **3. Chapter 3** 

![Dash3](https://github.com/user-attachments/assets/e810e9b7-1224-4e8f-b272-adb4099f6de9)

1. By creating a decomposition tree, we can get to detailed data on a given value in a very clear way, while seeing the relationships between individual groups. In this example, I choose Order Total -> Payment Method -> Product Color -> Product Price -> Product Name = Which finally returns information about what bike, for what total value, in black color was sold via PayPal

2. A very useful function is simple filtering, which can be found on the left side of the "Visualizations" tab. Just choose what values ​​we want to filter the results by, and the program will be able to extract them. I decided on the Order Status and Product Color filter, I placed the table with filters in the middle at the bottom of the dashboard.

3. Another useful tool is the Q&A function, which suggests questions and returns quick answers, this is especially useful for people who do not know the Power Bi program or detailed data analysis methods and only need quick answers.

4. Key influencers - this is a very useful method that can quickly suggest the cause of the problem. When we choose what value we want to analyze and based on what variable we intend to do it, the program will generate a mini chart with the indicated average and suggested correlation. In this example I tried to investigate whether there is a relationship between canceled orders and the bike model, as we can see orders for bikes from the BMX category were often canceled, which should draw the company's attention.

5. The last function I would like to show in this chapter is the meter - a very useful tool if we want to have insight into a given value in relation to the whole, e.g. when we want to check the stock level, which is indicated by the indicator I used.

		CREATE TABLE Best_Bikes (
		    product_color NCHAR(50),
		    product_name NCHAR(100)
		)
		
		INSERT INTO Best_Bikes (Product_Color, Product_Name)
		VALUES
		(N'Purple', N'DownhillDominator 8000'),
		(N'Orange', N'AeroSpeed 1000'),
		(N'Purple', N'DownhillDominator 7000'),
		(N'Black', N'DownhillDominator 5000'),
		(N'Blue', N'E-TrailBlazer 1000');


Now we can create an additional table with the 5 bikes that generated the highest combined profit, we discovered them in the previous queries.

I use the "CREATE TABLE" command to create the table and "INSERT INTO" to add the values. I add "N" before the words to ensure Unicode encoding. In this case I decided not to add ID because we will be connecting the table by bike name and their ID numbers would be different from those in the main table.

![SQL3](https://github.com/user-attachments/assets/7e01d352-059a-4ec9-940b-c8db2474cfcf)

Then, using LEFT JOIN, we can try to join records from the Main table and match them with values ​​from the Best_Bikes table using the product_name column. Then, using WHERE, we filter the result and leave only those rows for which product_name also exists in Best_Bikes.

The next query performs the same function, but returns all product names and in the column next to it, using the occurrence of the NULL value, determines whether a given product is in both tables. COALESCE is used to return the first value that is not = NULL. The CASE function used after ORDER BY is intended to assign the value 1,2 or 3 to each scenario so that the table can be arranged in a specific hierarchy. By default, SQL queries are assigned in ASC order (from smallest to largest), so values ​​1 = "yes" answers appear at the top and increase.


[Table of Contents](#table-of-contents)
## **4. Chapter 4**

In this chapter I will present some DAX functions. To do this we select "modeling" -> "new measure" to create the measures we need.

The first measure we will add is the sum

	Total Sales = SUM(Sales[SalesAmount])

 ![1](https://github.com/user-attachments/assets/d33d63e2-8ec7-450d-8120-fb1911328f40)

 Then we add the average. It is important to select "new measure" again for this purpose.

 	Mean Sales = AVERAGE(Sales[SalesAmount])

In the same way, we can calculate the average for a specific bike using the CALCULATE function.

![2](https://github.com/user-attachments/assets/d6e2280d-f6f0-4803-a0d5-21b54a903c74)

And also the standard deviation using the function below.

	StdDev_SalesAmount = CALCULATE(SQRT(SUMX(Sales, (Sales[SalesAmount] - [Mean_SalesAmount]) ^ 2) / (COUNTROWS(Sales) - 1)), Products[ProductCategory] = "Touring Bikes")

Standard deviation is used to measure the dispersion (variability) of data around the average value. The higher the standard deviation, the more dispersed the values ​​are in relation to the average.

A very important indicator in data analysis is calculating standard deviations. In this example, I would like to calculate the correlation between total sales - SalesAmount and Region. Above, we have already calculated the average for SalesAmount, and thanks to this we could calculate the standard deviation.

Now the same should be done with Region. However, this is a text variable, we need numerical data, so first we need to calculate the average sales from each region. This code will be useful for this:

	Mean_SalesAmount_By_Region = AVERAGEX(VALUES(Regions[RegionName]),CALCULATE(AVERAGE(Sales[SalesAmount])))

Then the standard deviation of this variable:

	StdDev_SalesAmount_By_Region = SQRT(SUMX(VALUES(Regions[RegionName]),POWER(CALCULATE(AVERAGE(Sales[SalesAmount])) - [Mean_SalesAmount_By_Region],2)) / (COUNTROWS(VALUES(Regions[RegionName])) - 1))

Now we need to calculate the covariance, we do this using this formula:

	Covariance_SalesRegion = SUMX(Sales,(Sales[SalesAmount] - [Mean_SalesAmount]) * (RELATED(Regions[RegionName]) - [Mean_SalesAmount_By_Region]))/(COUNTROWS(Sales) - 1)

Finally we can calculate the correlation.

 	Correlation_SalesAmount_Region = DIVIDE([Covariance_SalesRegion],[StdDev_SalesAmount] * [StdDev_SalesAmount_By_Region])

![3](https://github.com/user-attachments/assets/8b0bdf17-f2a1-481c-9c5a-0dcca2c61184)

As we could expect, the correlation is 1.00, which means that the connection between sales and region is really strong, which is also confirmed by the graph, where we can clearly see the advantage of North America over other regions.

These calculations are about summing the deviations from the average, squaring them (POWER), dividing by the number of data (COUNTROWS), and safe division (DIVIDE).

Additionally, we can always use the Quick Measure function, which will create a DAX formula for us, all we need to do is select the appropriate values.

Now I present graphs comparing average average sales overall and average sales per region. And total sales with a breakdown by store and individual buyers and per region.

![4](https://github.com/user-attachments/assets/c66591ec-2078-4c56-a29a-8f5b7ce4246b)


[Table of Contents](#table-of-contents)






