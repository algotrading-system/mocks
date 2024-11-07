from typing import List

import strawberry


@strawberry.type
class DescriptionType:
    title: str
    price: str


@strawberry.type
class DailyPNLType:
    title: str
    price: str
    percentage: float


@strawberry.type
class AllocType:
    title: str
    percentage: float


@strawberry.type
class ExtraInfoType:
    userAlias: str
    amount: str
    switched: bool


@strawberry.type
class OperationItemType:
    id: int
    title: str
    switched: bool
    description: DescriptionType
    dailyPNL: DailyPNLType
    assetAllocation: AllocType
    extraInfo: List[ExtraInfoType]

    # pydantic:
    #  - No hay validacion con bd
    # - Validacion de datos de entrada
    # input.title > 100

