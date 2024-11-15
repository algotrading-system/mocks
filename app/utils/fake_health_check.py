from app.api.graphql.types.health_check import IHealthCheckType, ServiceTypeEnum, HealthCheckTypeEnum, BGColorAlertEnum


def generate_fake_health_check() -> list[IHealthCheckType]:
    services = []
    for i in range(10):
        if i < 4:
            service = IHealthCheckType(
                service_type=ServiceTypeEnum.EXTERNAL.value,
                state=HealthCheckTypeEnum.OK.value,
                bg_color=BGColorAlertEnum.GREEN.value,
                name="Polygon.io",
                source="https://polygon.io/",
                message="texto opcional"
            )
        elif 4 <= i < 8:
            if i == 5:
                state = HealthCheckTypeEnum.WARNING.value
                bg_color = BGColorAlertEnum.YELLOW.value
            elif i == 6:
                state = HealthCheckTypeEnum.ALERT.value
                bg_color = BGColorAlertEnum.RED.value
            else:
                state = HealthCheckTypeEnum.OK.value
                bg_color = BGColorAlertEnum.GREEN.value

            service = IHealthCheckType(
                service_type=ServiceTypeEnum.BACK_ROOM.value,
                state=state,
                bg_color=bg_color,
                name="Estrategias",
                source="https://us-east-1.console.aws.amazon.com/console/home?region=us-east-1#",
                message="texto opcional"
            )
        else:
            service = IHealthCheckType(
                service_type=ServiceTypeEnum.ORDER_MANAGER.value,
                state=HealthCheckTypeEnum.OK.value,
                bg_color=BGColorAlertEnum.GREEN.value,
                name="Control Dashboard",
                source="https://algotrading.com/",
                message="texto opcional"
            )
        services.append(service)
    return services
