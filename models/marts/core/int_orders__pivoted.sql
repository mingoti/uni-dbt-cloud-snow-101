{%- set payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] -%}

with
cte_payments as
(
  select * from {{ ref('stg_payments') }}
),

cte_pivot as
(
      select order_id,
             {% for payment_method in payment_methods -%}
             sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
             {%- if not loop.last %} , {% endif %}
             {% endfor -%}
        from cte_payments
       where 1=1
         and status = 'success'
    group by order_id
)

select *
  from cte_pivot