from fastapi import APIRouter
from app.models.strategy import IOperationItem
from app.utils.fake_data import generate_fake_strategy

router = APIRouter()


@router.post("/test-create/", response_model=IOperationItem)
async def create_item(item: IOperationItem):
    return item


@router.get("/brokers/{brokerId}/", response_model=IOperationItem)
async def get_item(brokerId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/", response_model=IOperationItem)
async def get_profiles(brokerId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/", response_model=IOperationItem)
async def get_item(brokerId: int, profileId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/groups/", response_model=IOperationItem)
async def get_groups(brokerId: int, profileId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/groups/{groupId}/", response_model=IOperationItem)
async def get_item(brokerId: int, profileId: int, groupId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/groups/{groupId}/portfolios/", response_model=IOperationItem)
async def get_portfolios(brokerId: int, profileId: int, groupId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/groups/{groupId}/portfolios/{portfolioId}/", response_model=IOperationItem)
async def get_item(brokerId: int, profileId: int, groupId: int, portfolioId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/groups/{groupId}/portfolios/{portfolioId}/symbols/", response_model=IOperationItem)
async def get_symbols(brokerId: int, profileId: int, groupId: int, portfolioId: int):
    return generate_fake_strategy(brokerId)


@router.get("/brokers/{brokerId}/profiles/{profileId}/groups/{groupId}/portfolios/{portfolioId}/symbols/{symbolId}/", response_model=IOperationItem)
async def get_item(brokerId: int, profileId: int, groupId: int, portfolioId: int, symbolId: int):
    return generate_fake_strategy(brokerId)
