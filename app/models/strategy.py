from pydantic import BaseModel
from typing import List


class Description(BaseModel):
    title: str
    price: str


class DailyPNL(BaseModel):
    title: str
    price: str
    percentage: float


class Alloc(BaseModel):
    title: str
    percentage: float


class ExtraInfo(BaseModel):
    userAlias: str
    amount: str
    switched: bool


class IOperationItem(BaseModel):
    id: int
    title: str
    switched: bool
    description: Description
    dailyPNL: DailyPNL
    assetAllocation: Alloc
    extraInfo: List[ExtraInfo]
