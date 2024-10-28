-- Table: user (for reference as other tables refer to this table)
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    email VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);


-- Table: symbol
CREATE TABLE symbol (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    ticker VARCHAR,
    exchange VARCHAR,
    country_code VARCHAR,
    type_value VARCHAR,
    currency VARCHAR,
    isin VARCHAR,
    is_active BOOLEAN,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: account
CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    number VARCHAR NOT NULL,
    account_type VARCHAR NOT NULL,
    currency VARCHAR,
    initial_balance DOUBLE PRECISION,
    current_balance DOUBLE PRECISION,
    margin_available DOUBLE PRECISION,
    unrealized_pnl DOUBLE PRECISION,
    realized_pnl DOUBLE PRECISION,
    updated_at TIMESTAMP,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP
);

-- Table: broker
CREATE TABLE broker (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    country VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: at_group
CREATE TABLE at_group (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR UNIQUE,
    name VARCHAR NOT NULL,
    description VARCHAR,
    image_url VARCHAR,
    performance TEXT,
    symbol_distribution TEXT,
    symbol TEXT,
    strategies_composition TEXT,
    strategy_distribution TEXT,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: strategy
CREATE TABLE strategy (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    is_active BOOLEAN,
    exchange_id INT,
    strategy_param_id INT,
    arn_location VARCHAR,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: order_order
CREATE TABLE order_order (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES account(id),
    account_number VARCHAR,
    parent_id INT,
    parent_perm_id INT,
    perm_id INT,
    exchange VARCHAR,
    currency VARCHAR,
    contract_id VARCHAR,
    action VARCHAR,
    order_id VARCHAR,
    symbol VARCHAR,
    order_type VARCHAR,
    price DOUBLE PRECISION,
    quantity INT,
    status VARCHAR,
    lmt_price DOUBLE PRECISION,
    aux_price DOUBLE PRECISION,
    tif VARCHAR,
    filled INT,
    avg_fill_price INT,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    timestamp TIMESTAMP
);


-- Table: risk_profile
CREATE TABLE risk_profile (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR UNIQUE,
    name VARCHAR NOT NULL,
    description VARCHAR,
    min_score DECIMAL,
    max_score DECIMAL,
    image_url VARCHAR,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: order_log
CREATE TABLE order_log (
    id SERIAL PRIMARY KEY,
    open_order BOOLEAN NOT NULL,
    broker_id INT NOT NULL REFERENCES broker(id),
    broker_name VARCHAR NOT NULL,
    profile_id INT NOT NULL REFERENCES risk_profile(id),
    profile_name VARCHAR NOT NULL,
    group_id INT NOT NULL REFERENCES at_group(id),
    group_name VARCHAR NOT NULL,
    strategy_id INT NOT NULL REFERENCES strategy(id),
    strategy_name VARCHAR NOT NULL,
    account_number VARCHAR NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    contract_symbol VARCHAR NOT NULL,
    contract_id INT NOT NULL,
    action VARCHAR NOT NULL,
    quantity INT NOT NULL,
    order_type VARCHAR NOT NULL,
    stop_price DOUBLE PRECISION,
    order_status VARCHAR NOT NULL,
    filled INT NOT NULL,
    remaining INT NOT NULL,
    avg_fill_price DOUBLE PRECISION NOT NULL,
    currency VARCHAR NOT NULL,
    exchange VARCHAR NOT NULL,
    order_id INT NOT NULL REFERENCES order_order(id),
    perm_id INT NOT NULL,
    total_commissions DOUBLE PRECISION NOT NULL,
    commission_currency VARCHAR NOT NULL,
    net_trade_pnl INT,
    lag_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    direction_long VARCHAR NOT NULL,
    direction_short VARCHAR NOT NULL
);

-- Table: error_log
CREATE TABLE error_log (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES account(id),
    broker_id INT REFERENCES broker(id),
    broker_group_id INT REFERENCES at_group(id),
    risk_profile_id INT REFERENCES risk_profile(id),
    strategy_id INT REFERENCES strategy(id),
    order_id INT REFERENCES order_order(id),
    error_message VARCHAR,
    error_datetime TIMESTAMP,
    quantity INT,
    amount DECIMAL,
    currency VARCHAR,
    position_type VARCHAR,
    asset_allocation VARCHAR,
    error_type VARCHAR,
    current_condition VARCHAR,
    set_condition VARCHAR,
    gap VARCHAR,
    timestamp TIMESTAMP
);

-- Table: signals
CREATE TABLE signals (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES order_order(id),
    symbol VARCHAR,
    signal_type VARCHAR,
    strategy VARCHAR,
    timestamp TIMESTAMP
);

-- Table: order_fills
CREATE TABLE order_fills (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES order_order(id),
    execution_id VARCHAR,
    contract_id VARCHAR,
    commission DOUBLE PRECISION,
    currency VARCHAR,
    released_pnl DOUBLE PRECISION
);

-- Table: account_summary
CREATE TABLE account_summary (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES account(id),
    account_type VARCHAR,
    net_liquidation DECIMAL,
    total_cash_value DECIMAL,
    settled_cash DECIMAL,
    accrued_cash DECIMAL,
    buying_power DECIMAL,
    gross_position_value DECIMAL,
    available_funds DECIMAL,
    full_maint_margin_req DECIMAL,
    full_available_funds DECIMAL,
    created_at TIMESTAMP
);

-- Table: account_value
CREATE TABLE account_value (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES account(id),
    cash_balance DECIMAL,
    realized_pnl DECIMAL,
    unrealized_pnl DECIMAL,
    market_value DECIMAL,
    currency VARCHAR,
    created_at TIMESTAMP
);

-- Table: account_strategy_position
CREATE TABLE account_strategy_position (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES account(id),
    strategy_id INT REFERENCES strategy(id),
    symbol VARCHAR,
    contract_symbol INT,
    currency VARCHAR,
    position VARCHAR,
    average_cost VARCHAR,
    additional_info VARCHAR
);

-- Table: strategy_allocation
CREATE TABLE strategy_allocation (
    id SERIAL PRIMARY KEY,
    asset_allocation DOUBLE PRECISION,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: strategy_strategy_allocation
CREATE TABLE strategy_strategy_allocation (
    id SERIAL PRIMARY KEY,
    strategy_id INT REFERENCES strategy(id),
    strategy_allocation_id INT REFERENCES strategy_allocation(id)
);

-- Table: action_change
CREATE TABLE action_change (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    ticker VARCHAR,
    exchange VARCHAR,
    country_code VARCHAR,
    type_value VARCHAR,
    currency VARCHAR,
    isin VARCHAR,
    is_active BOOLEAN,
    created_by INT REFERENCES "user"(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Table: symbol_action_change
CREATE TABLE symbol_action_change (
    id SERIAL PRIMARY KEY,
    symbol_id INT REFERENCES symbol(id),
    action_change_id INT REFERENCES action_change(id)
);


-- Table: strategy_params
CREATE TABLE strategy_params (
    id SERIAL PRIMARY KEY,
    operational_hours TEXT
);

-- Table: exchange
CREATE TABLE exchange (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    open_from TIMESTAMP,
    open_until TIMESTAMP,
    country_code VARCHAR,
    symbol VARCHAR
);

-- Additional relation tables
CREATE TABLE group_risk_profile (
    id SERIAL PRIMARY KEY,
    group_id INT REFERENCES at_group(id),
    risk_profile_id INT REFERENCES risk_profile(id)
);

CREATE TABLE asset_manager_risk_profile (
    id SERIAL PRIMARY KEY,
    asset_manager_id INT,
    risk_profile_id INT
);

CREATE TABLE user_risk_profile (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(id),
    risk_profile_id INT REFERENCES risk_profile(id)
);
