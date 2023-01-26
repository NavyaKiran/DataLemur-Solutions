with cte as (select user_id, spend, transaction_date, row_number() 
over (partition by user_id order by transaction_date) as row_num 
from transactions) 

select user_id, spend, transaction_date 
from cte 
where row_num = 3;
