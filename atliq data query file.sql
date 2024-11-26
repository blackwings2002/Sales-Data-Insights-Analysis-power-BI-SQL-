

-- Selecting customer table 
select * from sales.customers;

-- how many transaction are there
select count(*) from sales.transactions;


select * from sales.transactions;
-- select transactions where market_code = Mark001
select * from sales.transactions where `market_code`="Mark001";

-- selecting the transaction in year 2020
Select * from sales.transactions where year(order_date) = 2020;

-- find the total revenue in year 2019
select sum(sales_amount) from sales.transactions where year(order_date) = 2019;

-- select revenue of the year 2020
select sum(sales_amount) from sales.transactions 
where year(order_date) = 2020 ;


-- fetch total revenue|
select sum(sales_amount) from sales.transactions
where currency= 'INR';

-- Total quantity 
select sum(sales_qty) from sales.transactions;

-- sales bu market using joins between two columns 
select markets_name,sum(sales_amount) from sales.transactions as s
inner join sales.markets as m
on s.market_code=m.markets_code
group by markets_name;

-- Top 5 customers by revenue
select custmer_name,sum(sales_amount) as sales from sales.transactions as s
inner join sales.customers as c
on s.customer_code=c.customer_code
group by custmer_name 
order by sales desc 
limit 5 ;


select * from products;

-- Top 5 products By revenue 
select p.product_code,sum(sales_amount)as sales from sales.transactions as s
Inner join products as p
on s.product_code = p.product_code 
Group By product_code
order by sales desc
limit 5;

-- Total profict Margin
select round(sum(profit_margin)) from sales.transactions;

-- profit Margin Percentage using CTE 
With market_profit as 
( select markets_name,profit_margin,sales_amount from sales.transactions t
inner join sales.markets m
on t.market_code=m.markets_code)
-- query using CTE 
select markets_name,
sum(profit_margin)/sum(sales_amount)*100 as profit_Margin_percentage
from market_profit
group BY markets_name
order by profit_Margin_percentage DESC ;
