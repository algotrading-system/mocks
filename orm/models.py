# coding: utf-8
from sqlalchemy import Boolean, Column, DateTime, Float, ForeignKey, Integer, Numeric, String, Text, text, TIMESTAMP
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class AssetManagerRiskProfile(Base):
    __tablename__ = 'asset_manager_risk_profile'

    id = Column(Integer, primary_key=True,  autoincrement=True)
    asset_manager_id = Column(Integer)
    risk_profile_id = Column(Integer)


class Broker(Base):
    __tablename__ = 'broker'

    id = Column(Integer, primary_key=True,  autoincrement=True)
    name = Column(String)
    country = Column(String)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    order_logs = relationship('OrderLog', back_populates='broker', lazy='select')
    account_operations = relationship("AccountOperation", back_populates="broker", lazy='select')
    error_logs = relationship('ErrorLog', back_populates='broker')


class Exchange(Base):
    __tablename__ = 'exchange'

    id = Column(Integer, primary_key=True,  autoincrement=True)
    name = Column(String)
    open_from = Column(DateTime)
    open_until = Column(DateTime)
    country_code = Column(String)
    symbol = Column(String)


class StrategyParam(Base):
    __tablename__ = 'strategy_params'

    id = Column(Integer, primary_key=True,  autoincrement=True)
    operational_hours = Column(Text)


class User(Base):
    __tablename__ = 'user'

    id = Column(Integer, primary_key=True,  autoincrement=True)
    name = Column(String)
    email = Column(String)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    accounts = relationship('Account', back_populates='user', lazy='select')
    action_changes = relationship('ActionChange', back_populates='user', lazy='select')
    at_groups = relationship('AtGroup', back_populates='user', lazy='select')
    risk_profiles = relationship('RiskProfile', back_populates='user', lazy='select')
    strategies = relationship('Strategy', back_populates='user', lazy='select')
    strategy_allocations = relationship('StrategyAllocation', back_populates='user', lazy='select')
    symbols = relationship('Symbol', back_populates='user', lazy='select')
    user_risk_profiles = relationship('UserRiskProfile', back_populates='user')


class Account(Base):
    __tablename__ = 'account'

    id = Column(Integer, primary_key=True, autoincrement=True)
    number = Column(String, nullable=False)
    account_type = Column(String, nullable=False)
    currency = Column(String)
    initial_balance = Column(Float(53))
    current_balance = Column(Float(53))
    margin_available = Column(Float(53))
    unrealized_pnl = Column(Float(53))
    realized_pnl = Column(Float(53))
    updated_at = Column(DateTime)
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)

    user = relationship('User', back_populates="accounts", lazy='select')
    account_operations = relationship("AccountOperation", back_populates="account", lazy='select')
    account_strategy_positions = relationship("AccountStrategyPosition", back_populates="account", lazy='select')
    account_summaries = relationship("AccountSummary", back_populates="account", lazy='select')
    account_values = relationship("AccountValue", back_populates="account", lazy='select')
    orders = relationship('OrderOrder', back_populates='account')
    error_logs = relationship('ErrorLog', back_populates='account')


class ActionChange(Base):
    __tablename__ = 'action_change'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    ticker = Column(String)
    exchange = Column(String)
    country_code = Column(String)
    type_value = Column(String)
    currency = Column(String)
    isin = Column(String)
    is_active = Column(Boolean)
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User', back_populates='action_changes', lazy='select')
    symbol_action_changes = relationship('SymbolActionChange', back_populates='action_change')


class AtGroup(Base):
    __tablename__ = 'at_group'

    id = Column(Integer, primary_key=True, autoincrement=True)
    uuid = Column(String, unique=True)
    name = Column(String, nullable=False)
    description = Column(String)
    image_url = Column(String)
    performance = Column(Text)
    symbol_distribution = Column(Text)
    symbol = Column(Text)
    strategies_composition = Column(Text)
    strategy_distribution = Column(Text)
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User', back_populates='at_groups', lazy='select')
    order_logs = relationship('OrderLog', back_populates='at_groups', lazy='select')
    account_operations = relationship("AccountOperation", back_populates="at_groups", lazy='select')
    group_risk_profiles = relationship('GroupRiskProfile', back_populates='at_groups')
    error_logs = relationship('ErrorLog', back_populates='at_groups')


class RiskProfile(Base):
    __tablename__ = 'risk_profile'

    id = Column(Integer, primary_key=True, autoincrement=True)
    uuid = Column(String, unique=True)
    name = Column(String, nullable=False)
    description = Column(String)
    min_score = Column(Numeric)
    max_score = Column(Numeric)
    image_url = Column(String)
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User', back_populates='risk_profiles', lazy='select')
    order_logs = relationship('OrderLog', back_populates='profile', lazy='select')
    account_operations = relationship("AccountOperation", back_populates="risk_profile", lazy='select')
    error_logs = relationship('ErrorLog', back_populates='risk_profile')


class Strategy(Base):
    __tablename__ = 'strategy'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    is_active = Column(Boolean)
    exchange_id = Column(Integer, nullable=True)
    strategy_param_id = Column(Integer, nullable=True)
    arn_location = Column(String)
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User', back_populates='strategies', lazy='select')
    order_logs = relationship('OrderLog', back_populates='strategy', lazy='select')
    account_operations = relationship("AccountOperation", back_populates="strategy", lazy='select')
    error_logs = relationship('ErrorLog', back_populates='strategy')


class StrategyAllocation(Base):
    __tablename__ = 'strategy_allocation'

    id = Column(Integer, primary_key=True, autoincrement=True)
    asset_allocation = Column(Float(53))
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User', back_populates='strategy_allocations', lazy='select')
    strategy_allocations = relationship('StrategyStrategyAllocation', back_populates='strategy_allocation')


class Symbol(Base):
    __tablename__ = 'symbol'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String, nullable=False)
    ticker = Column(String)
    exchange = Column(String)
    country_code = Column(String)
    type_value = Column(String)
    currency = Column(String)
    isin = Column(String)
    is_active = Column(Boolean)
    created_by = Column(ForeignKey('user.id'), nullable=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User', back_populates='symbols', lazy='select')
    symbol_action_changes = relationship('SymbolActionChange', back_populates='symbol')


class AccountStrategyPosition(Base):
    __tablename__ = 'account_strategy_position'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'), nullable=True)
    strategy_id = Column(ForeignKey('strategy.id'), nullable=True)
    symbol = Column(String)
    contract_symbol = Column(Integer)
    currency = Column(String)
    position = Column(String)
    average_cost = Column(String)
    additional_info = Column(String)

    account = relationship('Account', back_populates='account_strategy_positions', lazy='select')
    strategy = relationship('Strategy', lazy='select')


class AccountSummary(Base):
    __tablename__ = 'account_summary'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'), nullable=True)
    account_type = Column(String)
    net_liquidation = Column(Numeric)
    total_cash_value = Column(Numeric)
    settled_cash = Column(Numeric)
    accrued_cash = Column(Numeric)
    buying_power = Column(Numeric)
    gross_position_value = Column(Numeric)
    available_funds = Column(Numeric)
    full_maint_margin_req = Column(Numeric)
    full_available_funds = Column(Numeric)
    created_at = Column(DateTime)

    account = relationship('Account', back_populates='account_summaries', lazy='select')


class AccountValue(Base):
    __tablename__ = 'account_value'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'), nullable=True)
    cash_balance = Column(Numeric)
    realized_pnl = Column(Numeric)
    unrealized_pnl = Column(Numeric)
    market_value = Column(Numeric)
    currency = Column(String)
    created_at = Column(DateTime)

    account = relationship('Account', back_populates='account_values', lazy='select')


class GroupRiskProfile(Base):
    __tablename__ = 'group_risk_profile'

    id = Column(Integer, primary_key=True, autoincrement=True)
    group_id = Column(ForeignKey('at_group.id'), nullable=True)
    risk_profile_id = Column(ForeignKey('risk_profile.id'), nullable=True)

    group = relationship('AtGroup', back_populates='group_risk_profiles', lazy='select')
    risk_profile = relationship('RiskProfile', back_populates='group_risk_profiles', lazy='select')


class OrderOrder(Base):
    __tablename__ = 'order_order'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'), nullable=True)
    account_number = Column(String)
    parent_id = Column(Integer, nullable=True)
    parent_perm_id = Column(Integer, nullable=True)
    perm_id = Column(Integer, nullable=True)
    exchange = Column(String)
    currency = Column(String)
    contract_id = Column(String)
    action = Column(String)
    order_id = Column(String)
    symbol = Column(String)
    order_type = Column(String)
    price = Column(Float(53))
    quantity = Column(Integer)
    status = Column(String)
    lmt_price = Column(Float(53))
    aux_price = Column(Float(53))
    tif = Column(String)
    filled = Column(Integer)
    avg_fill_price = Column(Integer)
    created_at = Column(DateTime)
    update_at = Column(DateTime)
    timestamp = Column(TIMESTAMP)

    account = relationship('Account', back_populates='orders', lazy='select')
    order_logs = relationship('OrderLog', back_populates='order', lazy='select')
    order_fills = relationship('OrderFill', back_populates='order', lazy='select')
    error_logs = relationship('ErrorLog', back_populates='order', lazy='select')


class StrategyStrategyAllocation(Base):
    __tablename__ = 'strategy_strategy_allocation'

    id = Column(Integer, primary_key=True, autoincrement=True)
    strategy_id = Column(ForeignKey('strategy.id'), nullable=True)
    strategy_allocation_id = Column(ForeignKey('strategy_allocation.id'), nullable=True)

    strategy_allocation = relationship('StrategyAllocation', back_populates='strategy_allocations', lazy='select')
    strategy = relationship('Strategy', back_populates='strategy_allocations', lazy='select')


class SymbolActionChange(Base):
    __tablename__ = 'symbol_action_change'

    id = Column(Integer, primary_key=True, autoincrement=True)
    symbol_id = Column(ForeignKey('symbol.id'), nullable=True)
    action_change_id = Column(ForeignKey('action_change.id'), nullable=True)

    action_change = relationship('ActionChange', back_populates='symbol_action_changes', lazy='select')
    symbol = relationship('Symbol', back_populates='symbol_action_changes', lazy='select')


class UserRiskProfile(Base):
    __tablename__ = 'user_risk_profile'

    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(ForeignKey('user.id'), nullable=True)
    risk_profile_id = Column(ForeignKey('risk_profile.id'), nullable=True)

    risk_profile = relationship('RiskProfile', back_populates='user_risk_profiles', lazy='select')
    user = relationship('User', back_populates='user_risk_profiles', lazy='select')


class ErrorLog(Base):
    __tablename__ = 'error_log'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'), nullable=True)
    broker_id = Column(ForeignKey('broker.id'), nullable=True)
    broker_group_id = Column(ForeignKey('at_group.id'), nullable=True)
    risk_profile_id = Column(ForeignKey('risk_profile.id'), nullable=True)
    strategy_id = Column(ForeignKey('strategy.id'), nullable=True)
    order_id = Column(ForeignKey('order_order.id'), nullable=True)
    contract_symbol = Column(String)
    error_message = Column(String)
    error_datetime = Column(DateTime)
    quantity = Column(Integer)
    amount = Column(Numeric)
    currency = Column(String)
    position_type = Column(String)
    asset_allocation = Column(String)
    error_type = Column(String)
    current_condition = Column(String)
    set_condition = Column(String)
    gap = Column(String)
    timestamp = Column(TIMESTAMP)

    account = relationship('Account', back_populates='error_logs', lazy='select')
    broker_group = relationship('AtGroup', back_populates='error_logs', lazy='select')
    broker = relationship('Broker', back_populates='error_logs', lazy='select')
    order = relationship('OrderOrder', back_populates='error_logs', lazy='select')
    risk_profile = relationship('RiskProfile', back_populates='error_logs', lazy='select')
    strategy = relationship('Strategy', back_populates='error_logs', lazy='select')


class OrderFill(Base):
    __tablename__ = 'order_fills'

    id = Column(Integer, primary_key=True, autoincrement=True)
    order_id = Column(ForeignKey('order_order.id'), nullable=True)
    execution_id = Column(String)
    contract_id = Column(String)
    commission = Column(Float(53))
    currency = Column(String)
    released_pnl = Column(Float(53))

    order = relationship('OrderOrder', back_populates='order_fills', lazy='select')


class OrderLog(Base):
    __tablename__ = 'order_log'

    id = Column(Integer, primary_key=True, autoincrement=True)
    broker_id = Column(ForeignKey('broker.id'), nullable=True)
    broker_name = Column(String, nullable=False)
    profile_id = Column(ForeignKey('risk_profile.id'), nullable=True)
    profile_name = Column(String, nullable=False)
    group_id = Column(ForeignKey('at_group.id'), nullable=True)
    group_name = Column(String, nullable=False)
    strategy_id = Column(ForeignKey('strategy.id'), nullable=True)
    strategy_name = Column(String, nullable=False)
    account_number = Column(String, nullable=False)
    timestamp = Column(TIMESTAMP, nullable=False)
    contract_symbol = Column(String, nullable=False)
    contract_id = Column(Integer, nullable=False)
    action = Column(String, nullable=False)
    quantity = Column(Integer, nullable=False)
    order_type = Column(String, nullable=False)
    stop_price = Column(Float(53))
    order_status = Column(String, nullable=False)
    filled = Column(Integer, nullable=False)
    remaining = Column(Integer, nullable=False)
    avg_fill_price = Column(Float(53), nullable=False)
    currency = Column(String, nullable=False)
    exchange = Column(String, nullable=False)
    order_id = Column(ForeignKey('order_order.id'), nullable=True)
    order_parent_id = Column(ForeignKey('order_order.id'), nullable=True)
    perm_id = Column(Integer, nullable=False)
    parent_perm_id = Column(Integer)
    total_commissions = Column(Float(53), nullable=False)
    commission_currency = Column(String, nullable=False)
    net_trade_pnl = Column(Integer)
    lag_time = Column(DateTime, nullable=False)
    created_at = Column(DateTime, nullable=False)
    is_open_position = Column(Boolean)
    direction_trade = Column(String)

    broker = relationship('Broker', back_populates='order_logs')
    group = relationship('AtGroup', back_populates='order_logs')
    order = relationship('OrderOrder', back_populates='order_logs')
    profile = relationship('RiskProfile', back_populates='order_logs')
    strategy = relationship('Strategy', back_populates='order_logs')


class Signal(Base):
    __tablename__ = 'signals'

    id = Column(Integer, primary_key=True, autoincrement=True)
    order_id = Column(ForeignKey('order_order.id'), nullable=True)
    symbol = Column(String)
    signal_type = Column(String)
    strategy = Column(String)
    timestamp = Column(TIMESTAMP)

    order = relationship('OrderOrder', back_populates='signal')


class AccountOperation(Base):
    __tablename__ = 'account_operation'

    id = Column(Integer, primary_key=True)
    account_id = Column(Integer, ForeignKey('account.id'), nullable=True)  # Clave foránea opcional
    broker_id = Column(Integer, ForeignKey('broker.id'), nullable=True)
    broker_name = Column(String)
    broker_acculated_pnl_amount = Column(Float)
    broker_acculated_pnl_percentage = Column(Integer)
    broker_acculated_pnl_currency = Column(String)
    broker_acculated_in_amount = Column(Integer)
    broker_currency = Column(String)
    broker_asset_allocation_percentage = Column(Integer)
    risk_profile_id = Column(Integer, ForeignKey('risk_profile.id'), nullable=True)
    risk_profile_name = Column(String)
    risk_profile_acculated_pnl_amount = Column(Float)
    risk_profile_acculated_pnl_percentage = Column(Integer)
    risk_profile_acculated_pnl_currency = Column(String)
    risk_profile_acculated_in_amount = Column(Integer)
    risk_profile_currency = Column(String)
    risk_profile_asset_allocation_percentage = Column(Integer)
    group_id = Column(Integer, ForeignKey('at_group.id'), nullable=True)
    group_name = Column(String)
    group_acculated_pnl_amount = Column(Float)
    group_acculated_pnl_percentage = Column(Integer)
    group_acculated_pnl_currency = Column(String)
    group_acculated_in_amount = Column(Integer)
    group_currency = Column(String)
    group_asset_allocation_percentage = Column(Integer)
    strategy_id = Column(Integer, ForeignKey('strategy.id'), nullable=True)
    strategy_name = Column(String)
    strategy_acculated_pnl_amount = Column(Float)
    strategy_acculated_pnl_percentage = Column(Integer)
    strategy_acculated_pnl_currency = Column(String)
    strategy_acculated_in_amount = Column(Integer)
    strategy_currency = Column(String)
    strategy_asset_allocation_percentage = Column(Integer)
    created_at = Column(DateTime)
    timestamp = Column(TIMESTAMP)

    account = relationship("Account", back_populates="account_operations", lazy='select')
    broker = relationship("Broker", back_populates="account_operations", lazy='select')
    risk_profile = relationship("RiskProfile", back_populates="account_operations", lazy='select')
    group = relationship("AtGroup", back_populates="account_operations", lazy='select')
    strategy = relationship("Strategy", back_populates="account_operations", lazy='select')

