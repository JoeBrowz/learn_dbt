with orders as (

    select * from {{ ref('stg_orders') }}

),

payment as (

    select * from {{ ref('stg_payments') }}

),

order_payments as (

    select 
        order_id,
        sum(amount) as order_total

    from payment

    group by order_id

),

final as (

    select 
        order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.order_total, 0) as order_total
    
    from orders
    left join order_payments using (order_id)

)

select * from final