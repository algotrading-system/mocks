import strawberry
from typing import Optional
from datetime import datetime
from faker import Faker

fake = Faker()


# Definimos el tipo de Trade en GraphQL
@strawberry.type
class Trade:
    broker: str
    profile: str
    group: str
    strategy: str
    account: str
    symbol: str
    direction: str  # e.g., "SRT" for short
    quantity: int
    entry: datetime
    price: float
    market: float
    target: float
    stop: float
    exit: Optional[datetime]
    exit_price: Optional[float]
    pnl: float
    lag_time: float  # Time delay in seconds
