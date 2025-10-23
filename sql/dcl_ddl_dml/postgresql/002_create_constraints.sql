-- brands
ALTER TABLE brands ADD CONSTRAINT pk_brands PRIMARY KEY (brand_id);
ALTER TABLE brands ADD CONSTRAINT uk_brand_name UNIQUE (brand_name);

-- models
ALTER TABLE models ADD CONSTRAINT pk_models PRIMARY KEY (model_id);
ALTER TABLE models ADD CONSTRAINT fk_brands_models FOREIGN KEY (brand_id)
    REFERENCES brands (brand_id);
ALTER TABLE models ADD CONSTRAINT uk_model_name_brand UNIQUE (model_name, brand_id);
ALTER TABLE models ADD CONSTRAINT ck_displacement CHECK (model_displacement > 0);
ALTER TABLE models ADD CONSTRAINT ck_base_price CHECK (model_base_price > 0);

-- users
ALTER TABLE users ADD CONSTRAINT pk_users PRIMARY KEY (user_id);

-- trade_ins
ALTER TABLE trade_ins ADD CONSTRAINT pk_trade_ins PRIMARY KEY (trade_in_id);
ALTER TABLE trade_ins ADD CONSTRAINT fk_customer_users_trade_ins FOREIGN KEY (trade_in_customer_id)
    REFERENCES users (user_id);
ALTER TABLE trade_ins ADD CONSTRAINT fk_models_trade_ins FOREIGN KEY (trade_in_model_id)
    REFERENCES models (model_id);
ALTER TABLE trade_ins ADD CONSTRAINT uk_trade_in_plate UNIQUE (trade_in_plate);
ALTER TABLE trade_ins ADD CONSTRAINT ck_appraisal_price CHECK (trade_in_appraisal_price > 0);

-- options
ALTER TABLE options ADD CONSTRAINT pk_options PRIMARY KEY (option_id);
ALTER TABLE options ADD CONSTRAINT uk_option_name UNIQUE (option_name);

-- model_options
ALTER TABLE model_options ADD CONSTRAINT pk_model_options PRIMARY KEY (model_option_id);
ALTER TABLE model_options ADD CONSTRAINT fk_models_model_options FOREIGN KEY (model_id)
    REFERENCES models (model_id);
ALTER TABLE model_options ADD CONSTRAINT fk_options_model_options FOREIGN KEY (option_id)
    REFERENCES options (option_id);
ALTER TABLE model_options ADD CONSTRAINT uk_model_option UNIQUE (model_id, option_id);
ALTER TABLE model_options ADD CONSTRAINT ck_model_price CHECK (model_price > 0);

-- sales
ALTER TABLE sales ADD CONSTRAINT pk_sales PRIMARY KEY (sale_id);
ALTER TABLE sales ADD CONSTRAINT fk_customer_users_sales FOREIGN KEY (sale_customer_id)
    REFERENCES users (user_id);
ALTER TABLE sales ADD CONSTRAINT fk_seller_users_sales FOREIGN KEY (sale_seller_id)
    REFERENCES users (user_id);
ALTER TABLE sales ADD CONSTRAINT fk_models_sales FOREIGN KEY (sale_model_id)
    REFERENCES models (model_id);
ALTER TABLE sales ADD CONSTRAINT fk_trade_ins_sales FOREIGN KEY (trade_in_id)
    REFERENCES trade_ins (trade_in_id);
ALTER TABLE sales ADD CONSTRAINT uk_sale_new_plate UNIQUE (sale_new_plate);
ALTER TABLE sales ADD CONSTRAINT ck_sale_total_price CHECK (sale_total_price >= 0);

-- sale_options
ALTER TABLE sale_options ADD CONSTRAINT pk_sales_options PRIMARY KEY (sale_option_id);
ALTER TABLE sale_options ADD CONSTRAINT fk_sales_sale_options FOREIGN KEY (sale_id)
    REFERENCES sales (sale_id);
ALTER TABLE sale_options ADD CONSTRAINT fk_model_options_sale_options FOREIGN KEY (model_option_id)
    REFERENCES model_options (model_option_id);
ALTER TABLE sale_options ADD CONSTRAINT ck_option_price_at_sale CHECK (option_price_at_sale > 0);