select client_id
from client
where district_id=1
limit 5;

select client_id
from client
where district_id = 72
order by client_id Desc
limit 1;

select amount from loan
order by amount ASC
limit 3;

select distinct status from loan
order by status;

select loan_id from loan
where payments = (select MAX(payments) from loan);

select account_id, amount from loan
order by account_id
limit 5;

select distinct k_symbol from `order`
where k_symbol <> "";

select order_id from `order`
where account_id = 34;

select distinct account_id from `order`
where order_id >= 29540  AND order_id <= 29560;

select amount from `order`
where account_to=30067122;

select trans_id, date, type, amount from trans
where account_id = 793
order by date DESC
limit 10;

select district_id, count(client_id) from client
group by district_id
order by district_id
limit 9;

select type, count(card_id) from card
group by type;

select account_id, sum(amount) from loan
group by account_id
order by sum(amount) DESC
limit 10;

select date, count(loan_id) from loan
where date < 930907
group by date
order by date DESC;

select date, count(loan_id), duration from loan
group by duration, date
having date >= 971201 and date <= 971231 -- I could have also used like "9712%"
order by date ASC, duration ASC;

select account_id, type, sum(amount) as "total amount" from trans
group by account_id, type
having account_id = 396
order by type;

select account_id,
replace(replace(`type`, "PRIJEM", "INCOMING"), "VYDAJ", "OUTGOING") 
AS "transaction_type", floor(sum(amount)) as "total amount" from trans
group by account_id, type
having account_id = 396
order by type;

select account_id, 
(case when type = "PRIJEM"
then floor(sum(amount)) END) as "incoming amount",
(case when type = "VYDAJ" 
then floor(sum(amount)) END) as "outgoing amount",
floor(sum("incoming amount") - sum("outgoing amount")) as "difference"
from trans
where account_id = 396
group by account_id, "incoming amount"





