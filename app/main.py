from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from strawberry.fastapi import GraphQLRouter
from app.api.rest.operations import router as dashboard_router
from app.api.rest.alert import router as alert_router


# from algotrading_mocks import api_rest
from app.api.graphql.schema import schema  # Importamos el esquema


fastapp = FastAPI()

# rest_prefix = "/api/v1"
rest_prefix = "/"
# fastapp.include_router(dashboard_router, prefix=rest_prefix)
# fastapp.include_router(alert_router, prefix=rest_prefix)

graphql_app = GraphQLRouter(schema, path=f"{rest_prefix}")
# fastapp.include_router(graphql_app, prefix=f"{rest_prefix}/graphql")
fastapp.include_router(graphql_app)

fastapp.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
