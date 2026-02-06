---retention

with Delivered_orders as 
    
    ( select user_id,date_trunc(order_date,month) as order_date
            from `vaulted-epigram-475613-g4.raw_data.orders_clean`
            
       where status = 'delivered'
         group by user_id, order_date
  
  ),cohort as

      ( select user_id,min(order_date) as cohort_month
                from Delivered_orders
                group by user_id
        
  ), activity_with_cohort as 

        ( select c.user_id,c.cohort_month,
                  date_diff(d.order_date,c.cohort_month,MONTH) as month_since_cohort
                   from cohort c
                join Delivered_orders d using (user_id) 

        ), cohort_size as 
         
           ( select cohort_month,count(distinct user_id) as Total_cohort_customers 
                   from cohort 
                    group by cohort_month

    
  ) 
    select a.cohort_month,
           a.month_since_cohort,
           count(distinct a.user_id) as Customers,
           round(count(distinct a.user_id)*100/cs.Total_cohort_customers,2) as Retention_prc
                  from activity_with_cohort a
          join cohort_size cs using (cohort_month)
                  group by cohort_month,month_since_cohort,Total_cohort_customers
                  order by cohort_month,month_since_cohort
