from typing import List, Optional

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


@strawberry.type
class PNLInfo:
    id: int = strawberry.field(description="ID de la operacion.")
    name: str = strawberry.field(description="Nombre de la operacion.")
    acculated_pnl_amount: float = strawberry.field(description="Daily PNL.")
    acculated_pnl_percentage: int = strawberry.field(description="Porcentaje de la Daily PNL.")
    acculated_pnl_currency: str = strawberry.field(description="Moneda de Daily PNL.")
    acculated_in_amount: int = strawberry.field(description="Total In.")
    currency: str = strawberry.field(description="Moneda de Total In.")
    asset_allocation_percentage: str = strawberry.field(description="A. Allocation")
    flag_out: bool = strawberry.field(description="On/Off")


@strawberry.type
class AccountOperationType:
    id: int = strawberry.field(description="Identificador de la operacion.")
    account_id: Optional[int] = strawberry.field(description="Identificador de la cuenta.")
    broker: Optional[PNLInfo] = strawberry.field(description="Empresa asociada a la cuenta.")
    risk_profile: Optional[PNLInfo] = strawberry.field(description="Perfil de Riesgo.")
    group: Optional[PNLInfo] = strawberry.field(description="Grupo asociado al perfil de riesgo.")
    portfolio: Optional[PNLInfo]
    strategy: Optional[PNLInfo]
    timestamp: int
    created_at: str
    updated_at: Optional[str]
