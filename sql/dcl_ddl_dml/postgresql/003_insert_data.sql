-- 1) BRANDS
INSERT INTO brands (brand_name) VALUES ('Toyota');
INSERT INTO brands (brand_name) VALUES ('Honda');
INSERT INTO brands (brand_name) VALUES ('Ford');
INSERT INTO brands (brand_name) VALUES ('Volkswagen');

-- 2) OPTIONS (generic option catalog)
INSERT INTO options (option_name, option_description) VALUES
  ('Air Conditioning', 'Automatic climate control system'),
  ('Metallic Paint', 'Premium metallic paint finish'),
  ('Alloy Wheels', '17-inch alloy wheel set'),
  ('Leather Seats', 'Full leather upholstery'),
  ('Sunroof', 'Electric sliding sunroof'),
  ('Navigation System', 'Built-in navigation with live traffic');

-- 3) USERS (customers and sellers in same users table)
-- Customers
INSERT INTO users (user_name, user_address, user_phone) VALUES
  ('Alice Johnson', '14 Baker Street, London NW1 6XE, United Kingdom', '+44 7400 111001'),
  ('Bob Martinez', '22 King''s Road, Manchester M2 4AB, United Kingdom', '+44 7400 111002'),
  ('Carmen Ruiz', '8 Victoria Avenue, Birmingham B1 1AA, United Kingdom', '+44 7400 111003'),
  ('Diego López', '35 Queen Street, Liverpool L1 8JR, United Kingdom', '+44 7400 111004'),
  ('Elena García', '10 Highfield Road, Bristol BS8 2XH, United Kingdom', '+44 7400 111005');

-- Sellers (sales staff)
INSERT INTO users (user_name, user_address, user_phone) VALUES
  ('María Pérez', 'MotorLedger HQ, 120 Fleet Street, London EC4A 2BE, United Kingdom', '+44 7500 222101'),
  ('Juan Gómez', 'MotorLedger Regional Office, 78 Deansgate, Manchester M3 2FW, United Kingdom', '+44 7500 222102');

-- 4) MODELS (each model references brand_id)
INSERT INTO models (model_name, model_displacement, model_base_price, brand_id) VALUES
  ('Corolla', 1.80, 22000.00, 1),
  ('RAV4', 2.50, 30000.00, 1),
  ('Civic', 2.00, 24000.00, 2),
  ('Accord', 2.40, 32000.00, 2),
  ('Fiesta', 1.60, 18000.00, 3),
  ('Golf', 1.50, 23000.00, 4);

-- 5) MODEL_OPTIONS (price of each option varies per model)
INSERT INTO model_options (model_price, model_id, option_id) VALUES
  (700.00, 1, 1),   -- Corolla: AC
  (500.00, 1, 2),   -- Corolla: Metallic Paint
  (900.00, 1, 3),   -- Corolla: Alloy Wheels
  (800.00, 2, 2),   -- RAV4: Metallic Paint
  (1500.00, 2, 6),  -- RAV4: Navigation
  (1000.00, 2, 3),  -- RAV4: Alloy Wheels
  (850.00, 3, 3),   -- Civic: Alloy Wheels
  (1400.00, 3, 4),  -- Civic: Leather Seats
  (1200.00, 3, 6),  -- Civic: Navigation
  (1600.00, 4, 4),  -- Accord: Leather Seats
  (600.00, 5, 1),   -- Fiesta: AC
  (650.00, 6, 2),   -- Golf: Metallic Paint
  (1100.00, 6, 5);  -- Golf: Sunroof

-- 6) TRADE_INS (used cars customers give in)
INSERT INTO trade_ins (
  trade_in_plate,
  trade_in_appraisal_price,
  trade_in_cession_date,
  trade_in_customer_id,
  trade_in_model_id
) VALUES
  ('OLD123', 6000.00, DATE '2024-06-15', 1, 5),   -- Alice trades a Fiesta
  ('XYZ789', 8000.00, DATE '2023-11-02', 2, 3),   -- Bob trades a Civic
  ('ABC456', 12000.00, DATE '2025-01-10', 3, 2);  -- Carmen trades a RAV4

-- 7) SALES (timestamps used for sale_date)
INSERT INTO sales (
  sale_date,
  sale_new_plate,
  sale_total_price,
  sale_customer_id,
  sale_seller_id,
  sale_model_id,
  trade_in_id
) VALUES
  (TIMESTAMP '2024-06-20 10:30:00', 'NEW001', 26210.00, 1, 6, 2, 1), -- Alice buys RAV4 (uses trade_in 1)
  (TIMESTAMP '2023-11-10 15:45:00', 'NEW002', 18250.00, 2, 7, 3, 2), -- Bob buys Civic (uses trade_in 2)
  (TIMESTAMP '2025-02-05 11:20:00', 'NEW003', 12750.00, 3, 6, 6, 3), -- Carmen buys Golf (uses trade_in 3)
  (TIMESTAMP '2024-09-12 09:00:00', 'NEW004', 23600.00, 5, 7, 1, NULL), -- Elena buys Corolla (no trade-in)
  (TIMESTAMP '2024-03-18 14:10:00', 'NEW005', 18000.00, 4, 6, 5, NULL);  -- Diego buys Fiesta (no trade-in)

-- 8) SALE_OPTIONS (which options were selected at the time of sale)
-- sale_id and model_option_id values assumed to match auto-generated IDs given insertion order above

-- Sale 1 (sale_id = 1): RAV4 selected model_option_id 4 (metallic) and 5 (navigation)
INSERT INTO sale_options (option_price_at_sale, sale_id, model_option_id) VALUES
  (760.00, 1, 4),
  (1450.00, 1, 5);

-- Sale 2 (sale_id = 2): Civic selected model_option_id 6 (alloy) and 7 (leather)
INSERT INTO sale_options (option_price_at_sale, sale_id, model_option_id) VALUES
  (850.00, 2, 6),
  (1400.00, 2, 7);

-- Sale 3 (sale_id = 3): Golf selected model_option_id 12 (metallic) and 13 (sunroof)
-- NOTE: depending on insertion order, model_option_id for Golf Metallic and Sunroof are 12 and 13 here.
INSERT INTO sale_options (option_price_at_sale, sale_id, model_option_id) VALUES
  (620.00, 3, 12),
  (1050.00, 3, 13);

-- Sale 4 (sale_id = 4): Corolla selected model_option_id 1 (AC) and 3 (alloy)
INSERT INTO sale_options (option_price_at_sale, sale_id, model_option_id) VALUES
  (700.00, 4, 1),
  (900.00, 4, 3);

-- Sale 5: no options

COMMIT;
