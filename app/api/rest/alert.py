from fastapi import APIRouter

from app.models.alert import IBrokerAlert
from app.utils.fake_alert import generate_fake_broker_alert_model

router = APIRouter()


@router.get("/alerts/", response_model=IBrokerAlert)
async def get_broker_alert():
    return generate_fake_broker_alert_model()
