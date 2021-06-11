with payment as (

    select
        id as payment_id,
        orderid as order_id,
        amount / 100 as amount,
        created as sale_date,
        paymentmethod as payment_method

    from raw.stripe.payment
    where status != 'fail'

)

select * from payment