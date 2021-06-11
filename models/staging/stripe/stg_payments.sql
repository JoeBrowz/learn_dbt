with payment as (

    select
        orderid as order_id,
        amount,
        created as sale_date,
        paymentmethod

    from raw.stripe.payment
    where status != 'fail'

)

select * from payment