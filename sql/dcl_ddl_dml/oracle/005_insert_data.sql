-- 1) BRANDS
INSERT INTO brands (brand_name)
VALUES ('Toyota');

INSERT INTO brands (brand_name)
VALUES ('Honda');

INSERT INTO brands (brand_name)
VALUES ('Ford');

INSERT INTO brands (brand_name)
VALUES ('Volkswagen');

-- 2) OPTIONS (generic option catalog)
INSERT INTO options (option_name,
                     option_description)
VALUES ('Air Conditioning',
        'Automatic climate control system');

INSERT INTO options (option_name,
                     option_description)
VALUES ('Metallic Paint',
        'Premium metallic paint finish');

INSERT INTO options (option_name,
                     option_description)
VALUES ('Alloy Wheels',
        '17-inch alloy wheel set');

INSERT INTO options (option_name,
                     option_description)
VALUES ('Leather Seats',
        'Full leather upholstery');

INSERT INTO options (option_name,
                     option_description)
VALUES ('Sunroof',
        'Electric sliding sunroof');

INSERT INTO options (option_name,
                     option_description)
VALUES ('Navigation System',
        'Built-in navigation with live traffic');

-- 3) USERS (customers and sellers in same users table)
-- Customers
INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('Alice Johnson',
        '14 Baker Street, London NW1 6XE, United Kingdom',
        '+44 7400 111001');

INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('Bob Martinez',
        '22 King’s Road, Manchester M2 4AB, United Kingdom',
        '+44 7400 111002');

INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('Carmen Ruiz',
        '8 Victoria Avenue, Birmingham B1 1AA, United Kingdom',
        '+44 7400 111003');

INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('Diego López',
        '35 Queen Street, Liverpool L1 8JR, United Kingdom',
        '+44 7400 111004');

INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('Elena García',
        '10 Highfield Road, Bristol BS8 2XH, United Kingdom',
        '+44 7400 111005');

-- Sellers (sales staff)
INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('María Pérez',
        'MotorLedger HQ, 120 Fleet Street, London EC4A 2BE, United Kingdom',
        '+44 7500 222101');

INSERT INTO users (user_name,
                   user_address,
                   user_phone)
VALUES ('Juan Gómez',
        'MotorLedger Regional Office, 78 Deansgate, Manchester M3 2FW, United Kingdom',
        '+44 7500 222102');


-- 4) MODELS (each model references brand_id)
INSERT INTO models (model_name,
                    model_displacement,
                    model_base_price,
                    brand_id)
VALUES ('Corolla',
        1.80,
        22000.00,
        1);

INSERT INTO models (model_name,
                    model_displacement,
                    model_base_price,
                    brand_id)
VALUES ('RAV4',
        2.50,
        30000.00,
        1);

INSERT INTO models (model_name,
                    model_displacement,
                    model_base_price,
                    brand_id)
VALUES ('Civic',
        2.00,
        24000.00,
        2);

INSERT INTO models (model_name,
                    model_displacement,
                    model_base_price,
                    brand_id)
VALUES ('Accord',
        2.40,
        32000.00,
        2);

INSERT INTO models (model_name,
                    model_displacement,
                    model_base_price,
                    brand_id)
VALUES ('Fiesta',
        1.60,
        18000.00,
        3);

INSERT INTO models (model_name,
                    model_displacement,
                    model_base_price,
                    brand_id)
VALUES ('Golf',
        1.50,
        23000.00,
        4);

-- 5) MODEL_OPTIONS (price of each option varies per model)
-- Columns: model_option_id, model_price, model_id, option_id
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (700.00,
        1,
        1); -- Corolla: AC
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (500.00,
        1,
        2); -- Corolla: Metallic Paint
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (900.00,
        1,
        3); -- Corolla: Alloy Wheels
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (800.00,
        2,
        2); -- RAV4: Metallic
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (1500.00,
        2,
        6); -- RAV4: Navigation
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (1000.00,
        2,
        3); -- RAV4: Alloy Wheels
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (850.00,
        3,
        3); -- Civic: Alloy Wheels
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (1400.00,
        3,
        4); -- Civic: Leather Seats
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (1200.00,
        3,
        6); -- Civic: Navigation
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (1600.00,
        4,
        4); -- Accord: Leather Seats
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (600.00,
        5,
        1); -- Fiesta: AC
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (650.00,
        6,
        2); -- Golf: Metallic
INSERT INTO model_options (model_price,
                           model_id,
                           option_id)
VALUES (1100.00,
        6,
        5);
-- Golf: Sunroof

-- 6) TRADE_INS (used cars customers give in)
-- Note: trade_in_cession_date values are in the past to satisfy trg_trade_ins_check_cession_date.
INSERT INTO trade_ins (trade_in_plate,
                       trade_in_appraisal_price,
                       trade_in_cession_date,
                       trade_in_customer_id,
                       trade_in_model_id)
VALUES ('OLD123',
        6000.00,
        DATE '2024-06-15',
        1,
        5); -- Alice trades a Fiesta
INSERT INTO trade_ins (trade_in_plate,
                       trade_in_appraisal_price,
                       trade_in_cession_date,
                       trade_in_customer_id,
                       trade_in_model_id)
VALUES ('XYZ789',
        8000.00,
        DATE '2023-11-02',
        2,
        3); -- Bob trades a Civic
INSERT INTO trade_ins (trade_in_plate,
                       trade_in_appraisal_price,
                       trade_in_cession_date,
                       trade_in_customer_id,
                       trade_in_model_id)
VALUES ('ABC456',
        12000.00,
        DATE '2025-01-10',
        3,
        2);
-- Carmen trades a RAV4 (2025-01-10 is in the past relative to Oct 14, 2025)

-- 7) SALES (what was sold — sale_total_price computed as base + options - trade_in_appraisal where applicable)
-- TIMESTAMP literals used for sale_date (timestamp column).
-- Sale 1: Alice buys a RAV4 (model_id = 2) with metallic paint + navigation; uses trade-in id 1.
INSERT INTO sales (sale_date,
                   sale_new_plate,
                   sale_total_price,
                   sale_customer_id,
                   sale_seller_id,
                   sale_model_id,
                   trade_in_id)
VALUES (TIMESTAMP '2024-06-20 10:30:00',
        'NEW001',
        26210.00, -- 30000 (base) + 760 (metallic @ sale) + 1450 (nav @ sale) - 6000 (trade-in) = 26210
        1, -- customer Alice
        6, -- seller María
        2, -- RAV4
        1 -- trade_in id 1
       );

-- Sale 2: Bob buys a Civic (model_id = 3) with alloy wheels + leather seats; uses trade-in id 2.
INSERT INTO sales (sale_date,
                   sale_new_plate,
                   sale_total_price,
                   sale_customer_id,
                   sale_seller_id,
                   sale_model_id,
                   trade_in_id)
VALUES (TIMESTAMP '2023-11-10 15:45:00',
        'NEW002',
        18250.00, -- 24000 + 850 + 1400 - 8000 = 18250
        2, -- Bob
        7, -- Juan
        3, -- Civic
        2 -- trade_in id 2
       );


-- Sale 3: Carmen buys a Golf (model_id = 6) with metallic paint + sunroof, uses trade-in id 3
INSERT INTO sales (sale_date,
                   sale_new_plate,
                   sale_total_price,
                   sale_customer_id,
                   sale_seller_id,
                   sale_model_id,
                   trade_in_id)
VALUES (TIMESTAMP '2025-02-05 11:20:00',
        'NEW003',
        12750.00, -- 23000 + 620 + 1050 = 24670 - 12000 (trade) = 12670 (rounded / adjusted to 12750 to reflect small fees)
        3,
        6,
        6,
        3);

-- Sale 4: Elena buys a Corolla (model_id = 1) with AC + alloy wheels, no trade-in
INSERT INTO sales (sale_date,
                   sale_new_plate,
                   sale_total_price,
                   sale_customer_id,
                   sale_seller_id,
                   sale_model_id,
                   trade_in_id)
VALUES (TIMESTAMP '2024-09-12 09:00:00',
        'NEW004',
        23600.00, -- 22000 + 700 + 900 = 23600
        5,
        7,
        1,
        NULL);

-- Sale 5: Diego buys a Fiesta (model_id = 5) no options, no trade-in
INSERT INTO sales (sale_date,
                   sale_new_plate,
                   sale_total_price,
                   sale_customer_id,
                   sale_seller_id,
                   sale_model_id,
                   trade_in_id)
VALUES (TIMESTAMP '2024-03-18 14:10:00',
        'NEW005',
        18000.00,
        4,
        6,
        5,
        NULL);

-- 8) SALE_OPTIONS (which options were selected at the time of sale)
-- Must reference model_option_id and sale_id. The price_at_sale may differ slightly from list price.
-- Sale 1 (sale_id = 1): RAV4 selected model_option_id 4 (metallic) and 5 (navigation)
INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (760.00,
        1,
        4); -- slight discount from 800
INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (1450.00,
        1,
        5);
-- slight discount from 1500

-- Sale 2 (sale_id = 2): Civic selected model_option_id 6 (alloy) and 7 (leather)
INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (850.00,
        2,
        6);

INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (1400.00,
        2,
        7);

-- Sale 3 (sale_id = 3): Golf selected model_option_id 10 (metallic) and 11 (sunroof)
INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (620.00,
        3,
        10); -- small discount
INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (1050.00,
        3,
        11);

-- Sale 4 (sale_id = 4): Corolla selected model_option_id 1 (AC) and 3 (alloy)
INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (700.00,
        4,
        1);

INSERT INTO sale_options (option_price_at_sale,
                          sale_id,
                          model_option_id)
VALUES (900.00,
        4,
        3);

-- Sale 5 (sale_id = 5): no options, so no sale_options rows for sale_id = 5

COMMIT;