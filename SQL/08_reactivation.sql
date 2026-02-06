---reactivation

with prev_date as 

  ( select user_id,
            order_date,
           
           lag(order_date) over(partition by user_id order by order_date 
            ) as prev_order_date 
                 from  `vaulted-epigram-475613-g4.raw_data.orders_clean`
  ),
    gap_days as 

        ( select user_id,
                   order_date,
                   prev_order_date,
                   date_diff(order_date,prev_order_date,day) as gap_day
                    from prev_date

                  where prev_order_date is not null
                
            ) select user_id,
            order_date as reactivation_date,
              gap_day,
              case when gap_day >= 30 then 'Reactivated'
              else 'regular'
              end as user_type
              from gap_days

            where gap_day >= 30
            order by gap_day

