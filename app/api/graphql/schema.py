from enum import Enum
from typing import List

import strawberry

from app.api.graphql.types.alert import IBrokerAlertType
from app.api.graphql.types.operation import OperationItemType, DescriptionType, DailyPNLType, AllocType, ExtraInfoType
from app.api.graphql.types.order_log import Trade
from app.utils.fake_alert import generate_fake_broker_alert
from app.utils.fake_data import generate_fake_strategy
from app.utils.fake_order_logs import generate_fake_trades


@strawberry.enum
class OperationTypeEnum(Enum):
    BROKER = 'BROKER'
    PROFILE = 'PROFILE'
    GROUP = 'GROUP'


@strawberry.enum
class OrderLogTypeEnum(Enum):
    OPEN = 'OPEN'
    CLOSED = 'CLOSED'


@strawberry.type
class Query:

    @strawberry.field
    def order_log(self, order_log_type: OrderLogTypeEnum) -> List[Trade]:
        return generate_fake_trades()

    @strawberry.field
    def broker_alert(self) -> IBrokerAlertType:
        return generate_fake_broker_alert()

    @strawberry.field
    def operation_item(self, item_id: int, operation_type: OperationTypeEnum) -> OperationItemType:
        item_data = generate_fake_strategy(item_id)
        return OperationItemType(
            id=item_data.id,
            title=item_data.title,
            switched=item_data.switched,
            description=DescriptionType(
                title=item_data.description.title,
                price=item_data.description.price
            ),
            dailyPNL=DailyPNLType(
                title=item_data.dailyPNL.title,
                price=item_data.dailyPNL.price,
                percentage=item_data.dailyPNL.percentage
            ),
            assetAllocation=AllocType(
                title=item_data.assetAllocation.title,
                percentage=item_data.assetAllocation.percentage
            ),
            extraInfo=[
                ExtraInfoType(
                    userAlias=info.userAlias,
                    amount=info.amount,
                    switched=info.switched
                )
                for info in item_data.extraInfo
            ]
        )

# Generamos el esquema GraphQL
schema = strawberry.Schema(query=Query)
