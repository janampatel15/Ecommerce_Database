--Display all account's fname,lname,emails, phone# and date when account is created on, that are not from NY.
select 
account.fname, account.lname, account.email, account.cell_num, account.create_date, customer_order.S_State
from 
    customer_order,
    account
where
    account.account_id = customer_order.account_id
    and customer_order.S_State <> 'NY';


--Display order_id,payment date, returns date, total amount, refund amount and difference of refund from total amount.
select 
    payment.order_id, 
    payment.payment_date, 
    returns.returns_date, 
    payment.total_amount, 
    returns.refund_amount, 
    (payment.total_amount-returns.refund_amount) as Difference
from 
    payment, returns
where 
    returns.card_n = payment.card_n;

--Display total amount, total refund and difference of total refund from total amount for customer order who are not from city of Philadelphia
select 
    sum(payment.total_amount) as Total_sales, 
    sum(returns.refund_amount) as Refunds_Given, 
    (sum(payment.total_amount)-sum(returns.refund_amount)) as Difference
from 
    payment, 
    customer_order,
    returns 
where 
    customer_order.S_city <> 'Philadelphia' 
    and customer_order.order_ID = payment.order_ID 
    and customer_order.order_ID = returns.order_ID;





