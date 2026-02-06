---funnel
with Steps as 

    (select user_id,
    
    max( case when event_name = 'visist' then 1 else 0 end )as visited,
            max(case when event_name = 'add_to_cart' then 1 else 0 end) as add_to_cart,
           max(case when event_name ='purchase' then 1 else 0 end) as purchased
            from `vaulted-epigram-475613-g4.raw_data.events_clean`
            group by user_id
         )select count(*) as visited,
                 sum(case when add_to_cart = 1 then 1 else 0 end ) as cart,
                 sum(case when add_to_cart = 1 and purchased = 1 then 1 else 0 end) as  Buyers
                 from Steps
              
