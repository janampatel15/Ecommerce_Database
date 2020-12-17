-- update review flag from 0 to 1
update review set useful_flag='1' where useful_flag='0';

-- udpate review's r_star from 4.5 stars to 5 stars.
update review set r_star = '5' where r_star='4.5';

-- Update order_status where it says shipped to 'on its way'
update order_status set status = 'On its way' where status='Shipped';


--from payment remove any transaction which were less than $1000.00
delete from payment where total_amount<1000.00;

--delete reviews that has less than 4 stars
delete from review where R_star<4;

--delete any save for later items that are older than 01-Jan-20
delete from save_for_later where save_date<'01-Jan-20';

rollback;
