from enum import Enum
from typing import List, Optional

import strawberry

from app.api.graphql.inputs import UpdateOperationInput, UpdateOperationResponse, UpdateOperationPayload, \
    MutationResponseError, ClosePositionInput, ClosePositionResponse, ClosePositionPayload
from app.api.graphql.types.alert import IBrokerAlertType
from app.api.graphql.types.health_check import IHealthCheckType
from app.api.graphql.types.operation import OperationItemType, DescriptionType, DailyPNLType, AllocType, ExtraInfoType, \
    AccountOperationType
from app.api.graphql.types.order_log import Trade
from app.utils.fake_alert import generate_fake_broker_alert
from app.utils.fake_data import generate_fake_account_operation
from app.utils.fake_health_check import generate_fake_health_check
from app.utils.fake_order_logs import generate_fake_trades, get_trade_data


@strawberry.enum
class OperationTypeEnum(Enum):
    BROKER = 'BROKER'
    PROFILE = 'PROFILE'
    GROUP = 'GROUP'
    PORTFOLIO = 'PORTFOLIO'
    STRATEGY = 'STRATEGY'


@strawberry.enum
class OrderLogTypeEnum(Enum):
    OPEN = 'OPEN'
    CLOSED = 'CLOSED'


@strawberry.type
class Query:

    @strawberry.field
    def order_log(
        self,
        account_id: int,
        order_log_type: OrderLogTypeEnum,
        is_fake: Optional[bool] = None,
        can_error: Optional[bool] = None,
    ) -> List[Trade]:
        if can_error:
            return []
        if is_fake:
            return generate_fake_trades()
        else:
            return get_trade_data(is_open=order_log_type.value == OrderLogTypeEnum.OPEN)

    @strawberry.field
    def broker_alert(self, account_id: int) -> IBrokerAlertType:
        return generate_fake_broker_alert()

    @strawberry.field
    def health_check(self, account_id: Optional[int] = None) -> list[IHealthCheckType]:
        return generate_fake_health_check()

    @strawberry.field
    def account_operation(
        self,
        account_id: int,
        item_id: int,
        operation_type: OperationTypeEnum,
        is_fake: Optional[bool] = None,
        can_error: Optional[bool] = None,
    ) -> Optional[AccountOperationType]:
        item_data = generate_fake_account_operation(item_id, operation_type, is_fake)
        return item_data


@strawberry.type
class Mutation:
    @strawberry.field
    def update_operation(self, input: UpdateOperationInput) -> UpdateOperationResponse:
        try:
            payload = {"success": True}
            return UpdateOperationPayload(**payload)
        except Exception as exp:
            return MutationResponseError(
                message=f"{exp}"
            )

    @strawberry.field
    def close_positions(self, input: ClosePositionInput) -> ClosePositionResponse:
        try:
            payload = {"success": True}
            return ClosePositionPayload(**payload)
        except Exception as exp:
            return MutationResponseError(
                message=f"{exp}"
            )


# Generamos el esquema GraphQL
schema = strawberry.Schema(
    query=Query,
    mutation=Mutation
)
