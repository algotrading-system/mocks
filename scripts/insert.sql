-- Tabla: user
INSERT INTO "user" (id, name, created_at)
VALUES
  (1, 'John Doe', NOW());

-- Tabla: account
INSERT INTO account (id, number, account_type, currency, initial_balance, current_balance, margin_available, unrealized_pnl, realized_pnl, updated_at, created_by, created_at)
VALUES
  (1, 'ACC123', 'Savings', 'USD', 10000.0, 12000.0, 5000.0, 150.0, 200.0, NOW(), 1, NOW());

-- Tabla: broker
INSERT INTO broker (id, name, country, created_at, updated_at)
VALUES
  (1, 'Broker A', 'USA', NOW(), NOW());

-- Tabla: risk_profile
INSERT INTO risk_profile (id, uuid, name, description, min_score, max_score, image_url, created_by, created_at, updated_at)
VALUES
  (1, 'UUID-001', 'Conservative', 'Low-risk profile', 0.0, 20.0, NULL, 1, NOW(), NOW());

-- Tabla: strategy
INSERT INTO strategy (id, name, is_active, exchange_id, strategy_param_id, arn_location, created_by, created_at, updated_at)
VALUES
  (1, 'Strategy A', TRUE, 1, NULL, 'arn:aws:12345', 1, NOW(), NOW());

-- Tabla: group
INSERT INTO group (id, uuid, name, description, image_url, performance, symbol_distribution, symbol, strategies_composition, strategy_distribution, created_by, created_at, updated_at)
VALUES
  (1, 'UUID-GRP-001', 'Group A', 'Description of Group A', NULL, 'Performance Text', 'Distribution Text', 'SYMB', 'Strategies Composition Text', 'Strategy Distribution Text', 1, NOW(), NOW());

-- Tabla: account_operation
INSERT INTO account_operation (id, account_id, broker_id, broker_name, broker_acculated_pnl_amount, broker_acculated_pnl_percentage, broker_acculated_pnl_currency, broker_acculated_in_amount, broker_currency, broker_asset_allocation_percentage, risk_profile_id, risk_profile_name, risk_profile_acculated_pnl_amount, risk_profile_acculated_pnl_percentage, risk_profile_acculated_pnl_currency, risk_profile_acculated_in_amount, risk_profile_currency, risk_profile_asset_allocation_percentage, group_id, group_name, group_acculated_pnl_amount, group_acculated_pnl_percentage, group_acculated_pnl_currency, group_acculated_in_amount, group_currency, group_asset_allocation_percentage, strategy_id, strategy_name, strategy_acculated_pnl_amount, strategy_acculated_pnl_percentage, strategy_acculated_pnl_currency, strategy_acculated_in_amount, strategy_currency, strategy_asset_allocation_percentage, created_at, timestamp)
VALUES
  (1, 1, 1, 'Broker A', 100.0, 10, 'USD', 1000, 'USD', 20, 1, 'Risk A', 200.0, 15, 'USD', 2000, 'USD', 25, 1, 'Group A', 300.0, 20, 'USD', 3000, 'USD', 30, 1, 'Strategy A', 400.0, 25, 'USD', 4000, 'USD', 35, NOW(), NOW());

-- Tabla: order_order
INSERT INTO order_order (id, account_id, account_number, parent_id, parent_perm_id, perm_id, exchange, currency, contract_id, action, order_id, symbol, order_type, price, quantity, status, lmt_price, aux_price, tif, filled, avg_fill_price, created_at, update_at, timestamp)
VALUES
  (1, 1, 'ACC123', NULL, NULL, 12345, 'NYSE', 'USD', '123ABC', 'BUY', 'ORD789', 'AAPL', 'LIMIT', 150.0, 10, 'Filled', 150.0, 0.0, 'GTC', 10, 150.0, NOW(), NOW(), NOW());

-- Tabla: order_log
INSERT INTO order_log (id, open_order, broker_id, broker_name, profile_id, profile_name, group_id, group_name, strategy_id, strategy_name, account_number, timestamp, contract_symbol, contract_id, action, quantity, order_type, stop_price, order_status, filled, remaining, avg_fill_price, currency, exchange, order_id, perm_id, total_commissions, commission_currency, net_trade_pnl, lag_time, created_at, direction_long, direction_short)
VALUES
  (1, TRUE, 1, 'Broker A', 1, 'Profile A', 1, 'Group A', 1, 'Strategy A', 'ACC123', NOW(), 'AAPL', 1001, 'BUY', 10, 'LIMIT', 150.0, 'Filled', 10, 0, 150.0, 'USD', 'NYSE', 2001, 100001, 1.5, 'USD', 100, NOW(), NOW(), 'LONG', 'SHORT');

-- Tabla: signals
INSERT INTO signals (id, order_id, symbol, signal_type, strategy, timestamp)
VALUES
  (1, 1, 'AAPL', 'Buy Signal', 'Strategy A', NOW());

-- Tabla: error_log
INSERT INTO error_log (id, account_id, account_acculated_pnl_amount, account_acculated_pnl_percentage, account_acculated_pnl_currency, account_acculated_in_amount, account_asset_allocation_percentage, account_currency, broker_id, broker_acculated_pnl_amount, broker_acculated_pnl_percentage, broker_acculated_pnl_currency, broker_acculated_in_amount, broker_asset_allocation_percentage, broker_currency, broker_group_id, broker_group_acculated_pnl_amount, broker_group_acculated_pnl_percentage, broker_group_acculated_pnl_currency, broker_group_acculated_in_amount, broker_group_asset_allocation_percentage, broker_group_currency, risk_profile_id, risk_profile_acculated_pnl_amount, risk_profile_acculated_pnl_percentage, risk_profile_acculated_pnl_currency, risk_profile_acculated_in_amount, risk_profile_asset_allocation_percentage, risk_profile_currency, strategy_id, strategy_acculated_pnl_amount, strategy_acculated_pnl_percentage, strategy_acculated_pnl_currency, strategy_acculated_in_amount, strategy_asset_allocation_percentage, strategy_currency, order_id, error_message, error_datetime, quantity, amount, currency, position_type, asset_allocation, error_type, current_condition, set_condition, gap, timestamp)
VALUES
  (1, 1, 150.0, 15, 'USD', 500, 20, 'USD', 1, 120.0, 10, 'USD', 1000, 15, 'USD', 1, 200.0, 12, 'USD', 1500, 25, 'USD', 1, 220.0, 10, 'USD', 1200, 18, 'USD', 1, 300.0, 20, 'USD', 2000, 30, 'USD', 1, 'Order not filled', '2024-10-28 15:00:00', 5, 100.0, 'USD', 'Long', 'High Allocation', 'Warning', 'Condition A', 'Condition B', '0.5%', NOW());

-- Tabla: account_summary
INSERT INTO account_summary (id, account_id, account_type, net_liquidation, total_cash_value, settled_cash, accrued_cash, buying_power, gross_position_value, available_funds, full_maint_margin_req, full_available_funds, created_at)
VALUES
  (1, 1, 'Trading', 20000.0, 15000.0, 12000.0, 3000.0, 25000.0, 20000.0, 15000.0, 5000.0, 25000.0, NOW());

-- Tabla: account_value
INSERT INTO account_value (id, account_id, cash_balance, realized_pnl, unrealized_pnl, market_value, currency, created_at)
VALUES
  (1, 1, 15000.0, 500.0, -200.0, 18000.0, 'USD', NOW());

INSERT INTO account_operation (
    account_id, broker_id, broker_name, broker_acculated_pnl_amount, broker_acculated_pnl_percentage, broker_acculated_pnl_currency,
    broker_acculated_in_amount, broker_currency, broker_asset_allocation_percentage, risk_profile_id, risk_profile_name,
    risk_profile_acculated_pnl_amount, risk_profile_acculated_pnl_percentage, risk_profile_acculated_pnl_currency, risk_profile_acculated_in_amount,
    risk_profile_currency, risk_profile_asset_allocation_percentage, group_id, group_name, group_acculated_pnl_amount,
    group_acculated_pnl_percentage, group_acculated_pnl_currency, group_acculated_in_amount, group_currency, group_asset_allocation_percentage,
    strategy_id, strategy_name, strategy_acculated_pnl_amount, strategy_acculated_pnl_percentage, strategy_acculated_pnl_currency,
    strategy_acculated_in_amount, strategy_currency, strategy_asset_allocation_percentage, created_at, timestamp
)
VALUES
    (1, 1, 'Broker A', 100.0, 10, 'USD', 1000, 'USD', 20, 1, 'Risk A', 200.0, 15, 'USD', 2000, 'USD', 25, 1, 'Group A', 300.0, 20, 'USD', 3000, 'USD', 30, 1, 'Strategy A', 400.0, 25, 'USD', 4000, 'USD', 35, NOW(), NOW());