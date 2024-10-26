from faker import Faker
from app.models.strategy import IOperationItem, Description, DailyPNL, Alloc, ExtraInfo

fake = Faker()


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