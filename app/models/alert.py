from pydantic import BaseModel
from typing import List

# Definir los modelos más anidados primero

class IETFAlertDetail(BaseModel):
    failReason: str
    current: str
    stablished: str
    difference: str

class IETFAlert(BaseModel):
    etf: str
    qty: str
    value: str
    position: str
    percentage: str
    details: List[IETFAlertDetail]

class IStrategyAlert(BaseModel):
    name: str
    value: str
    percentage: str
    children: List[IETFAlert]

class IGroupAlert(BaseModel):
    name: str
    value: str
    percentage: str
    children: List[IStrategyAlert]

class IProfileAlert(BaseModel):
    name: str
    value: str
    percentage: str
    children: List[IGroupAlert]

class IBrokerAlert(BaseModel):
    name: str
    value: str
    percentage: str
    children: List[IProfileAlert]
