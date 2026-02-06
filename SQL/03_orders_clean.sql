 ---orders_clean
      
      create or replace view `vaulted-epigram-475613-g4.raw_data.orders_clean` as 

with Ranked_orders as

    ( select order_id,
              user_id,
            case when amount like '₹%' then cast(replace(amount,'₹','') as INT )
            when amount = 'null' then null 
            else cast(amount as INT)
            end as amount,
            COALESCE(
      SAFE.PARSE_DATE('%Y-%m-%d', order_date),   -- 2024-01-01
      SAFE.PARSE_DATE('%d-%m-%Y', order_date),   -- 01-01-2024
      SAFE.PARSE_DATE('%Y/%m/%d', order_date),   -- 2024/01/01
      SAFE.PARSE_DATE('%m/%d/%Y', order_date)    -- 01/01/2024
    ) AS order_date,
            lower(status) as status,
            row_number() over (partition by order_id order by updated_at desc) as rn,
            from  `vaulted-epigram-475613-g4.raw_data.orders`
            where user_id not like 'test' 
            and order_date <> '2030-01-01'
    ) select * from Ranked_orders
    where rn =1;
