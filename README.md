I AM STILL WORKING ON THIS PROJECT, IT IS NOT FULLY FINISHED YET :)

Hello,

in this work I present several dashboards in the Power Bi program and queries in the MS SQL Server program.

Each dashboard is contained in a separate chapter, to which the appropriate folder is assigned. Of course, you can download the Power Bi file from there, the .xlsx file ready to open in Excel, the file in the .csv form to upload it to SQL and screenshots of the dashboard and search results in the MS SQL Server program.

Below is a short table of contents with links to each chapter, and then there is my actual work - screenshots of dashboards, screenshots of SQL results and my explanations.

---

1. Chapter 1 - Dashboard, SQL (ALTER TABLE, SUM, COUNT, SUBQUERY, GROUP BY, HAVING)
2. Chapter 2 - Dashboard, SQL (FORMAT, ROUND, AVG, OVER, RANK, PARTITION BY, WHERE)

---

# Table of Contents
- [Table of Contents](#table-of-contents)
- [1. Chapter 1](#1-chapter-1)
- [2. Chapter 2](#2-chapter-2)


## **2. Chapter 1**

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

The second query returns the number of subcategories that are in the 'Road Bikes' category, into which the bikes are divided. We can see that there are 12 of them, which will be useful in future analyses.

  [Table of Contents](#table-of-contents)
## **2. Chapter 2** 

![Dash2](https://github.com/user-attachments/assets/b834fa39-2891-4c88-9a09-648153a2982b)

1. We place the KPI of the total orders and the total products in stock at the top, so that we have a good overview of the data during the entire analysis. The first is the total orders over the dates, the second is the product stock.

2. We create a pie chart to determine which bike categories contributed to the total sales. "Mountain Bikes" and "Road Bikes" stand out significantly, the smallest value is for "Kids Bikes".

3. In the pie chart settings, in the general - label tab, we set "Label contents = Percentage of category".

4. We add a chart border, in General -> Effects.

5. We create a bar chart by color, add "product color" and "order total". Blue is definitely the leading color, the least frequently chosen color is silver.

6. We add visual labels and a border.

7. From the order date and the total orders, we create a line chart to check if there is a sales trend. The highest sales were on March 7.

8. We add a clustered bar chart to show sales by region. Europe is clearly the leader.

![SQL2](https://github.com/user-attachments/assets/41351010-baec-4c22-88dc-334d0fb1b65e)

The query will work correctly, returning the total orders, average product price and product color only for the regions "Europe" and "Asia" where the average product price is greater than 1700.

The second result is TOP 5, The query will return 5 rows (largest orders), sorted by Order_Total, and additionally RANK() will assign rankings within each product color, starting from 1 for the highest value.

