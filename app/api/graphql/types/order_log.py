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
    target: Optional[float] = None
    stop: Optional[float] = None
    exit: Optional[datetime] = None
    exit_price: Optional[float] = None
    pnl: Optional[float] = None
    lag_time: Optional[float] = None
    bg_color: Optional[str] = None
