SELECT *
FROM brands;

SELECT *
FROM options;

SELECT *
FROM users;

SELECT *
FROM models;

SELECT *
FROM model_options;

SELECT *
FROM trade_ins;

SELECT *
FROM sales;

SELECT *
FROM sale_options;

-- Comprehensive verification query
SELECT s.sale_id,
       s.sale_date,
       c.user_name AS customer_name,
       v.user_name AS seller_name,
       b.brand_name,
       m.model_name,
       s.sale_total_price,
       ti.trade_in_plate,
       mo.option_name,
       so.option_price_at_sale
FROM sales s
         JOIN users c ON s.sale_customer_id = c.user_id -- Check valid customer
         JOIN users v ON s.sale_seller_id = v.user_id -- Check valid seller
         JOIN models m ON s.sale_model_id = m.model_id -- Check valid model
         JOIN brands b ON m.brand_id = b.brand_id -- Check valid brand
         LEFT JOIN trade_ins ti ON s.trade_in_id = ti.trade_in_id -- Verify existence of trade-in if applicable
         LEFT JOIN sale_options so ON s.sale_id = so.sale_id -- Check associated options
         LEFT JOIN model_options mo_rel ON so.model_option_id = mo_rel.model_option_id
         LEFT JOIN options mo ON mo_rel.option_id = mo.option_id
ORDER BY s.sale_date DESC;

-- Consistency of total sale price (base + options - trade_in ≈ sale_total_price).
SELECT s.sale_id,
       m.model_base_price,
       nvl(opt.sum_options, 0)                                      AS sum_options_at_sale
        ,
       nvl(ti.trade_in_appraisal_price, 0)                          AS trade_in_value
        ,
       s.sale_total_price,
       round((m.model_base_price + nvl(opt.sum_options, 0) - nvl(ti.trade_in_appraisal_price, 0)),
             2)                                                     AS expected_total
        ,
       (s.sale_total_price - (m.model_base_price + nvl(opt.sum_options, 0) -
                              nvl(ti.trade_in_appraisal_price, 0))) AS diff
FROM sales s
         JOIN models m ON s.sale_model_id = m.model_id
         LEFT JOIN (SELECT so.sale_id,
                           SUM(so.option_price_at_sale) sum_options
                    FROM sale_options so
                    GROUP BY so.sale_id) opt ON s.sale_id = opt.sale_id
         LEFT JOIN trade_ins ti ON s.trade_in_id = ti.trade_in_id
WHERE abs(s.sale_total_price - (m.model_base_price + nvl(opt.sum_options, 0) - nvl(ti.trade_in_appraisal_price, 0))) >
      1.0;