"""actualizando modelo order log y error log

Revision ID: 16e6e194ce7e
Revises: d5623e1b0fee
Create Date: 2024-11-06 22:12:29.559010

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '16e6e194ce7e'
down_revision: Union[str, None] = 'd5623e1b0fee'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('error_log', sa.Column('contract_symbol', sa.String(), nullable=True))
    op.add_column('order_log', sa.Column('order_parent_id', sa.Integer(), nullable=True))
    op.add_column('order_log', sa.Column('parent_perm_id', sa.Integer(), nullable=True))
    op.add_column('order_log', sa.Column('is_open_position', sa.Boolean(), nullable=True))
    op.add_column('order_log', sa.Column('direction_trade', sa.String(), nullable=True))
    op.create_foreign_key(None, 'order_log', 'order_order', ['order_parent_id'], ['id'])
    op.drop_column('order_log', 'direction_short')
    op.drop_column('order_log', 'open_order')
    op.drop_column('order_log', 'direction_long')
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('order_log', sa.Column('direction_long', sa.VARCHAR(), autoincrement=False, nullable=False))
    op.add_column('order_log', sa.Column('open_order', sa.BOOLEAN(), autoincrement=False, nullable=False))
    op.add_column('order_log', sa.Column('direction_short', sa.VARCHAR(), autoincrement=False, nullable=False))
    op.drop_constraint(None, 'order_log', type_='foreignkey')
    op.drop_column('order_log', 'direction_trade')
    op.drop_column('order_log', 'is_open_position')
    op.drop_column('order_log', 'parent_perm_id')
    op.drop_column('order_log', 'order_parent_id')
    op.drop_column('error_log', 'contract_symbol')
    # ### end Alembic commands ###