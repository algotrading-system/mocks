from faker import Faker

from app.api.graphql.types.alert import IBrokerAlertType, IProfileAlertType, IGroupAlertType, IStrategyAlertType, \
    IETFAlertType, IETFAlertDetailType
from app.models.alert import IBrokerAlert, IProfileAlert, IGroupAlert, IStrategyAlert, IETFAlert, IETFAlertDetail

fake = Faker()


# Generador de datos simulados
def generate_fake_broker_alert() -> IBrokerAlertType:
    return IBrokerAlertType(
        name=fake.company(),
        value=f"{fake.random_number(digits=5)} USD",
        percentage=f"{fake.random_int(min=0, max=100)}%",
        children=[
            IProfileAlertType(
                name=fake.name(),
                value=f"{fake.random_number(digits=5)} USD",
                percentage=f"{fake.random_int(min=0, max=100)}%",
                children=[
                    IGroupAlertType(
                        name=fake.job(),
                        value=f"{fake.random_number(digits=5)} USD",
                        percentage=f"{fake.random_int(min=0, max=100)}%",
                        children=[
                            IStrategyAlertType(
                                name=fake.catch_phrase(),
                                value=f"{fake.random_number(digits=5)} USD",
                                percentage=f"{fake.random_int(min=0, max=100)}%",
                                children=[
                                    IETFAlertType(
                                        etf=fake.bs(),
                                        qty=f"{fake.random_int(min=1, max=100)}",
                                        value=f"{fake.random_number(digits=5)} USD",
                                        position="IN" if fake.boolean() else "OUT",
                                        percentage=f"{fake.random_int(min=0, max=100)}%",
                                        details=[
                                            IETFAlertDetailType(
                                                failReason="STOP LOSS",  # Puedes agregar más razones
                                                current=f"{fake.random_number(digits=4)} USD",
                                                stablished=f"{fake.random_number(digits=4)} USD",
                                                difference=f"{fake.random_number(digits=3)} USD"
                                            )
                                        ]
                                    ) for _ in range(2)
                                ]
                            ) for _ in range(2)
                        ]
                    ) for _ in range(2)
                ]
            ) for _ in range(2)
        ]
    )


def generate_fake_broker_alert_model() -> IBrokerAlert:
    return IBrokerAlert(
        name=fake.company(),
        value=f"{fake.random_number(digits=5)} USD",
        percentage=f"{fake.random_int(min=0, max=100)}%",
        children=[
            IProfileAlert(
                name=fake.name(),
                value=f"{fake.random_number(digits=5)} USD",
                percentage=f"{fake.random_int(min=0, max=100)}%",
                children=[
                    IGroupAlert(
                        name=fake.job(),
                        value=f"{fake.random_number(digits=5)} USD",
                        percentage=f"{fake.random_int(min=0, max=100)}%",
                        children=[
                            IStrategyAlert(
                                name=fake.catch_phrase(),
                                value=f"{fake.random_number(digits=5)} USD",
                                percentage=f"{fake.random_int(min=0, max=100)}%",
                                children=[
                                    IETFAlert(
                                        etf=fake.bs(),
                                        qty=f"{fake.random_int(min=1, max=100)}",
                                        value=f"{fake.random_number(digits=5)} USD",
                                        position="IN" if fake.boolean() else "OUT",
                                        percentage=f"{fake.random_int(min=0, max=100)}%",
                                        details=[
                                            IETFAlertDetail(
                                                failReason="STOP LOSS",
                                                current=f"{fake.random_number(digits=4)} USD",
                                                stablished=f"{fake.random_number(digits=4)} USD",
                                                difference=f"{fake.random_number(digits=3)} USD"
                                            )
                                        ]
                                    ) for _ in range(2)
                                ]
                            ) for _ in range(2)
                        ]
                    ) for _ in range(2)
                ]
            ) for _ in range(2)
        ]
    )