with orders as (

    select * from {{ ref('stg_orders') }}

),

payment as (

    select * from {{ ref('stf_payment') }}

),

fct_orders as (

    select 
        order_id,
        customer_id,
        sum(amount)

    from orders
    join payment using (order_id)

    group by order_id

)

select * from fct_orders