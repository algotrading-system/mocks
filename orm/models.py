# coding: utf-8
from sqlalchemy import Boolean, Column, DateTime, Float, ForeignKey, Integer, Numeric, String, Text, text
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
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)

    user = relationship('User')


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
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User')


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
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User')


class RiskProfile(Base):
    __tablename__ = 'risk_profile'

    id = Column(Integer, primary_key=True, autoincrement=True)
    uuid = Column(String, unique=True)
    name = Column(String, nullable=False)
    description = Column(String)
    min_score = Column(Numeric)
    max_score = Column(Numeric)
    image_url = Column(String)
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User')


class Strategy(Base):
    __tablename__ = 'strategy'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    is_active = Column(Boolean)
    exchange_id = Column(Integer)
    strategy_param_id = Column(Integer)
    arn_location = Column(String)
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User')


class StrategyAllocation(Base):
    __tablename__ = 'strategy_allocation'

    id = Column(Integer, primary_key=True, autoincrement=True)
    asset_allocation = Column(Float(53))
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User')


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
    created_by = Column(ForeignKey('user.id'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    user = relationship('User')


class AccountStrategyPosition(Base):
    __tablename__ = 'account_strategy_position'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'))
    strategy_id = Column(ForeignKey('strategy.id'))
    symbol = Column(String)
    contract_symbol = Column(Integer)
    currency = Column(String)
    position = Column(String)
    average_cost = Column(String)
    additional_info = Column(String)

    account = relationship('Account')
    strategy = relationship('Strategy')


class AccountSummary(Base):
    __tablename__ = 'account_summary'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'))
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

    account = relationship('Account')


class AccountValue(Base):
    __tablename__ = 'account_value'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'))
    cash_balance = Column(Numeric)
    realized_pnl = Column(Numeric)
    unrealized_pnl = Column(Numeric)
    market_value = Column(Numeric)
    currency = Column(String)
    created_at = Column(DateTime)

    account = relationship('Account')


class GroupRiskProfile(Base):
    __tablename__ = 'group_risk_profile'

    id = Column(Integer, primary_key=True, autoincrement=True)
    group_id = Column(ForeignKey('at_group.id'))
    risk_profile_id = Column(ForeignKey('risk_profile.id'))

    group = relationship('AtGroup')
    risk_profile = relationship('RiskProfile')


class OrderOrder(Base):
    __tablename__ = 'order_order'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'))
    account_number = Column(String)
    parent_id = Column(Integer)
    parent_perm_id = Column(Integer)
    perm_id = Column(Integer)
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
    timestamp = Column(DateTime)

    account = relationship('Account')


class StrategyStrategyAllocation(Base):
    __tablename__ = 'strategy_strategy_allocation'

    id = Column(Integer, primary_key=True, autoincrement=True)
    strategy_id = Column(ForeignKey('strategy.id'))
    strategy_allocation_id = Column(ForeignKey('strategy_allocation.id'))

    strategy_allocation = relationship('StrategyAllocation')
    strategy = relationship('Strategy')


class SymbolActionChange(Base):
    __tablename__ = 'symbol_action_change'

    id = Column(Integer, primary_key=True, autoincrement=True)
    symbol_id = Column(ForeignKey('symbol.id'))
    action_change_id = Column(ForeignKey('action_change.id'))

    action_change = relationship('ActionChange')
    symbol = relationship('Symbol')


class UserRiskProfile(Base):
    __tablename__ = 'user_risk_profile'

    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(ForeignKey('user.id'))
    risk_profile_id = Column(ForeignKey('risk_profile.id'))

    risk_profile = relationship('RiskProfile')
    user = relationship('User')


class ErrorLog(Base):
    __tablename__ = 'error_log'

    id = Column(Integer, primary_key=True, autoincrement=True)
    account_id = Column(ForeignKey('account.id'))
    broker_id = Column(ForeignKey('broker.id'))
    broker_group_id = Column(ForeignKey('at_group.id'))
    risk_profile_id = Column(ForeignKey('risk_profile.id'))
    strategy_id = Column(ForeignKey('strategy.id'))
    order_id = Column(ForeignKey('order_order.id'))
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
    timestamp = Column(DateTime)

    account = relationship('Account')
    broker_group = relationship('AtGroup')
    broker = relationship('Broker')
    order = relationship('OrderOrder')
    risk_profile = relationship('RiskProfile')
    strategy = relationship('Strategy')


class OrderFill(Base):
    __tablename__ = 'order_fills'

    id = Column(Integer, primary_key=True, autoincrement=True)
    order_id = Column(ForeignKey('order_order.id'))
    execution_id = Column(String)
    contract_id = Column(String)
    commission = Column(Float(53))
    currency = Column(String)
    released_pnl = Column(Float(53))

    order = relationship('OrderOrder')


class OrderLog(Base):
    __tablename__ = 'order_log'

    id = Column(Integer, primary_key=True, autoincrement=True)
    # open_order = Column(Boolean, nullable=False)
    broker_id = Column(ForeignKey('broker.id'), nullable=False)
    broker_name = Column(String, nullable=False)
    profile_id = Column(ForeignKey('risk_profile.id'), nullable=False)
    profile_name = Column(String, nullable=False)
    group_id = Column(ForeignKey('at_group.id'), nullable=False)
    group_name = Column(String, nullable=False)
    strategy_id = Column(ForeignKey('strategy.id'), nullable=False)
    strategy_name = Column(String, nullable=False)
    account_number = Column(String, nullable=False)
    timestamp = Column(DateTime, nullable=False)
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
    order_id = Column(ForeignKey('order_order.id'), nullable=False)
    order_parent_id = Column(ForeignKey('order_order.id'))
    perm_id = Column(Integer, nullable=False)
    parent_perm_id = Column(Integer)
    total_commissions = Column(Float(53), nullable=False)
    commission_currency = Column(String, nullable=False)
    net_trade_pnl = Column(Integer)
    lag_time = Column(DateTime, nullable=False)
    created_at = Column(DateTime, nullable=False)
    is_open_position = Column(Boolean)
    direction_trade = Column(String)
    # direction_long = Column(String, nullable=False)
    # direction_short = Column(String, nullable=False)

    broker = relationship('Broker')
    group = relationship('AtGroup')
    order = relationship('OrderOrder')
    profile = relationship('RiskProfile')
    strategy = relationship('Strategy')


class Signal(Base):
    __tablename__ = 'signals'

    id = Column(Integer, primary_key=True, autoincrement=True)
    order_id = Column(ForeignKey('order_order.id'))
    symbol = Column(String)
    signal_type = Column(String)
    strategy = Column(String)
    timestamp = Column(DateTime)

    order = relationship('OrderOrder')
