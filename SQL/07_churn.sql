--- Churn_Analysis
     
     
     with max_date as 

    ( select max(order_date) as max_date,
             from  `vaulted-epigram-475613-g4.raw_data.orders_clean`
 ),
   last_order_date as 
    
          ( select user_id,max(order_date) as last_order_date
                 from  `vaulted-epigram-475613-g4.raw_data.orders_clean`
                  group by user_id
)

   select l.user_id,
      
           date_diff(m.max_date,l.last_order_date,day) as days_since_last_order,
           case when  date_diff(m.max_date,l.last_order_date,day)>= 30 then 'Churned'
           else 'Active' end as churn_status
           from last_order_date l 
        cross join max_date m 
        order by days_since_last_order
          
                 
                 
                 
