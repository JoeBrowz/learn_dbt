select
    id as payment_id,
    orderid as order_id,
    
    -- convert amount in cents to dollars
    amount / 100 as amount,
    created as sale_date,
    paymentmethod as payment_method,
    status

from raw.stripe.payment