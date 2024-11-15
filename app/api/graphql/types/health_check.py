from enum import Enum
import strawberry


@strawberry.enum
class HealthCheckTypeEnum(Enum):
    OK = 'OK'
    WARNING = 'WARNING'
    ALERT = 'ALERT'


@strawberry.enum
class BGColorAlertEnum(Enum):
    GREEN = 'GREEN'
    RED = 'RED'
    YELLOW = 'YELLOW'


@strawberry.enum
class ServiceTypeEnum(Enum):
    EXTERNAL = 'EXTERNAL'
    BACK_ROOM = 'BACK_ROOM'
    ORDER_MANAGER = 'ORDER_MANAGER'


@strawberry.type
class IHealthCheckType:
    service_type: ServiceTypeEnum = strawberry.field(description="Tipo de servicio como fuente de dato")
    state: HealthCheckTypeEnum = strawberry.field(description="Estado del servicio, si esta disponible, advertencia o esta caido")
    bg_color: BGColorAlertEnum = strawberry.field(description="Color que se utiliza como indicador del estado")
    name: str = strawberry.field(description="Nombre del Servicio")
    source: str = strawberry.field(description="Fuente de dato, puede ser una URL")
    message: str = strawberry.field(description="Mnesaje opcional en caso se necesite mayor informacion")
