WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
),
order_payments AS (
    SELECT 
        order_id,
        SUM(IF(status = 'success', amount, NULL)) as amount
    FROM payments
    GROUP BY 1
),


final AS (

    SELECT
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        COALESCE(order_payments.amount,0) AS amount
    FROM orders
    LEFT JOIN order_payments using (order_id)
)

SELECT * FROM final