from faker import Faker

from app.api.graphql.types.operation import PNLInfo, AccountOperationType
from app.models.strategy import IOperationItem, Description, DailyPNL, Alloc, ExtraInfo

fake = Faker()


def generate_fake_account_operation(item_id: int, operation_type: str, is_fake: bool) -> AccountOperationType:
    from app.api.graphql.schema import OperationTypeEnum

    load_broker = False
    load_profile = False
    load_group = False
    load_portfolio = False
    load_strategy = False

    if is_fake:
        acculated_pnl_amount = round(fake.pyfloat(left_digits=6, right_digits=2), 2)
        acculated_pnl_percentage = fake.random_int(min=-100, max=100)
    else:
        acculated_pnl_amount = 200
        acculated_pnl_percentage = 17

    if operation_type == OperationTypeEnum.BROKER:
        load_broker = True

    elif operation_type == OperationTypeEnum.PROFILE:
        load_broker = True
        load_profile = True

    elif operation_type == OperationTypeEnum.GROUP:
        load_broker = True
        load_profile = True
        load_group = True
        load_portfolio = False

    elif operation_type == OperationTypeEnum.PORTFOLIO:
        load_broker = True
        load_profile = True
        load_group = True
        load_portfolio = True
        load_strategy = False

    elif operation_type == OperationTypeEnum.STRATEGY:
        load_broker = True
        load_profile = True
        load_group = True
        load_portfolio = True
        load_strategy = True

    def generate_broker() -> PNLInfo:
        name = "IBKR"

        return PNLInfo(
            name=name,
            acculated_pnl_amount=acculated_pnl_amount,
            acculated_pnl_percentage=acculated_pnl_percentage,
            acculated_pnl_currency="$",
            acculated_in_amount=1000100,
            currency="$",
            asset_allocation_percentage=100
        )

    def generate_profile() -> PNLInfo:
        name = "Agresivo"

        return PNLInfo(
            name=name,
            acculated_pnl_amount=acculated_pnl_amount,
            acculated_pnl_percentage=acculated_pnl_percentage,
            acculated_pnl_currency="$",
            acculated_in_amount=1000100,
            currency="$",
            asset_allocation_percentage=100
        )

    def generate_group() -> PNLInfo:
        name = "Algotrading"

        return PNLInfo(
            name=name,
            acculated_pnl_amount=acculated_pnl_amount,
            acculated_pnl_percentage=acculated_pnl_percentage,
            acculated_pnl_currency="$",
            acculated_in_amount=1000100,
            currency="$",
            asset_allocation_percentage=100
        )

    def generate_strategy() -> PNLInfo:
        name = "AT-30M-AH v2.1"

        return PNLInfo(
            name=name,
            acculated_pnl_amount=acculated_pnl_amount,
            acculated_pnl_percentage=acculated_pnl_percentage,
            acculated_pnl_currency="$",
            acculated_in_amount=1000100,
            currency="$",
            asset_allocation_percentage=100
        )

    return AccountOperationType(
        id=item_id,
        account_id=1,
        broker=generate_broker() if load_broker else None,
        risk_profile=generate_profile() if load_profile else None,
        group=generate_group() if load_group else None,
        portfolio=generate_strategy() if load_portfolio else None,
        strategy=generate_strategy() if load_strategy else None,
        timestamp=int(fake.date_time_between(start_date='-1y', end_date='now').timestamp()), # Unix timestamp en segundos
        created_at=fake.iso8601(),
        updated_at=fake.iso8601()
    )


def generate_fake_strategy(item_id: int) -> IOperationItem:
    return IOperationItem(
        id=item_id,
        title=fake.company(),
        switched=fake.boolean(),
        description=Description(
            title=fake.sentence(),
            price=f"{fake.random_number(digits=5)} USD"
        ),
        dailyPNL=DailyPNL(
            title="Daily PNL",
            price=f"{fake.random_number(digits=5)} USD",
            percentage=fake.pyfloat(min_value=0, max_value=100, right_digits=2)
        ),
        assetAllocation=Alloc(
            title="Allocation",
            percentage=fake.pyfloat(min_value=0, max_value=100, right_digits=2)
        ),
        extraInfo=[
            ExtraInfo(
                userAlias=fake.user_name(),
                amount=f"{fake.random_number(digits=5)} USD",
                switched=fake.boolean()
            ) for _ in range(3)
        ]
    )
    # return IOperationItem(
    #     id=item_id,
    #     title=f"Broker {item_id}",
    #     switched=True,
    #     description=Description(title="Description", price="1000 USD"),
    #     dailyPNL=DailyPNL(title="Daily PNL", price="500 USD", percentage=10.0),
    #     alloc=Alloc(title="Allocation", percentage=15.5),
    #     extraInfo=[
    #         ExtraInfo(userAlias="user1", amount="500 USD", switched=True),
    #         ExtraInfo(userAlias="user2", amount="300 USD", switched=False)
    #     ]
    # )
