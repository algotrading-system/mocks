from fastapi import FastAPI
from strawberry.fastapi import GraphQLRouter
from app.api.rest.operations import router as dashboard_router
from app.api.rest.alert import router as alert_router


# from algotrading_mocks import api_rest
from app.api.graphql.schema import schema  # Importamos el esquema


fastapp = FastAPI()

rest_prefix = "/api/v1"
fastapp.include_router(dashboard_router, prefix=rest_prefix)
fastapp.include_router(alert_router, prefix=rest_prefix)

graphql_app = GraphQLRouter(schema)
fastapp.include_router(graphql_app, prefix=f"{rest_prefix}/graphql")
