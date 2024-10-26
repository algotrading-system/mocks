from typing import List
from faker import Faker

from app.api.graphql.types.order_log import Trade

fake = Faker()


def generate_fake_trades() -> List[Trade]:
    trades = []
    for _ in range(10):
        trade = Trade(
            broker=fake.company(),
            profile=fake.job(),
            group=fake.bs(),
            strategy=fake.catch_phrase(),
            account=f"{fake.random_number(digits=5)} - {fake.user_name()}",
            symbol=fake.currency_code(),
            direction="SRT" if fake.boolean() else "LONG",
            quantity=fake.random_int(min=1, max=1000),
            entry=fake.date_time_this_year(),
            price=round(fake.pyfloat(min_value=1, max_value=1000, right_digits=2), 2),
            market=round(fake.pyfloat(min_value=1, max_value=1000, right_digits=2), 2),
            target=round(fake.pyfloat(min_value=1, max_value=1000, right_digits=2), 2),
            stop=round(fake.pyfloat(min_value=1, max_value=1000, right_digits=2), 2),
            exit=fake.date_time_this_year() if fake.boolean() else None,
            exit_price=round(fake.pyfloat(min_value=1, max_value=1000, right_digits=2), 2) if fake.boolean() else None,
            pnl=round(fake.pyfloat(min_value=-10000, max_value=10000, right_digits=2), 2),
            lag_time=round(fake.pyfloat(min_value=0, max_value=60, right_digits=2), 2)  # delay in seconds
        )
        trades.append(trade)
    return trades
