import strawberry
from typing import List, Optional

# Definir los tipos más anidados primero


@strawberry.type
class IETFAlertDetailType:
    failReason: str  # Cambia a Enum si es necesario
    current: str
    stablished: str
    difference: str


@strawberry.type
class IETFAlertType:
    etf: str
    qty: str
    currency: str
    value: str
    position: str
    percentage: str
    details: List[IETFAlertDetailType]


@strawberry.type
class IStrategyAlertType:
    name: str = strawberry.field(description="El nombre de la estrategia.")
    currency: str = strawberry.field(description="Moneda.")
    value: str
    percentage: str
    children: List[IETFAlertType]


@strawberry.type
class IGroupAlertType:
    name: str
    currency: str
    value: str
    percentage: str
    children: List[IStrategyAlertType]


@strawberry.type
class IProfileAlertType:
    name: str
    currency: str
    value: str
    percentage: str
    children: List[IGroupAlertType]


@strawberry.type
class IBrokerAlertType:
    name: str
    currency: str
    value: str
    percentage: str
    children: List[IProfileAlertType]
