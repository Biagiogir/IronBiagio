-- use the schema "bank" so you don't need to use it in the functions later
use bank;

select * from bank.account where account_id>10 order by account_id DESC ;

select *, amount-payments AS "balance in dollars" from bank.loan ;

-- adding constant column
-- select *, "Biagio" from bank.loan

select * from loan
where status NOT IN ("B", "b") ;

-- Distinct
-- select distinct status from loan
-- select status.amount from loan
-- select count(*) from loan

select distinct A2,A4 status from bank.district
where A2 ('Benesov', 'Beroun') OR A4 < 75000

-- select max(amount) from loan

-- filter by multiple column (the second column is only if the first value is equal)
-- select * from loan order by amount ASC, payments DESC
-- select ceiling(avg(amount)), floor(avg(amount)) from loan

-- select power (2,3)
-- select *, left(A2, 2), ltrim(A2) from bank.district;
-- select substring ("Hello world", 7, 4)
-- select substring_index("www.google.com", ".", 2)

-- select * from bank.district
-- where A3 like "north%" (everything that starts with north
-- (otherwise) where A3 like "north_" (contains)

-- select status, avg(amount) from loan
-- group by status

-- select status, amount, avg(payments) from loan
-- group by status, amount (it make sense to just groupby for categorical variables)
