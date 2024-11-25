from typing import Optional

import strawberry

from app.api.graphql.types.health_check import LevelTypeEnum


@strawberry.input()
class UpdateOperationInput:
    account_id: int
    broker_id: Optional[int] = None
    broker_out: bool
    profile_id: Optional[int] = None
    profile_out: bool
    group_id: Optional[int] = None
    group_out: bool
    strategy_id: Optional[int] = None
    strategy_out: bool
    symbol_id: Optional[int] = None
    symbol_out: bool


@strawberry.input()
class ClosePositionInput:
    account_id: int
    level: LevelTypeEnum
    operation_id: Optional[int] = None


@strawberry.type
class UpdateOperationPayload:
    success: bool


@strawberry.type
class ClosePositionPayload:
    success: bool


@strawberry.type
class MutationResponseError:
    error_code: str
    message: Optional[str] = ""


UpdateOperationResponse = strawberry.union(
    "UpdateOperationResponse",
    types=(UpdateOperationPayload,) + (MutationResponseError, ),
)

ClosePositionResponse = strawberry.union(
    "ClosePositionResponse",
    types=(ClosePositionPayload,) + (MutationResponseError, ),
)