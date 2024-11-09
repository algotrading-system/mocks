"""check model definitions

Revision ID: e20af7969275
Revises: 16e6e194ce7e
Create Date: 2024-11-09 11:36:03.782604

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'e20af7969275'
down_revision: Union[str, None] = '16e6e194ce7e'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('account_operation',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('account_id', sa.Integer(), nullable=True),
    sa.Column('broker_id', sa.Integer(), nullable=True),
    sa.Column('broker_name', sa.String(), nullable=True),
    sa.Column('broker_acculated_pnl_amount', sa.Float(), nullable=True),
    sa.Column('broker_acculated_pnl_percentage', sa.Integer(), nullable=True),
    sa.Column('broker_acculated_pnl_currency', sa.String(), nullable=True),
    sa.Column('broker_acculated_in_amount', sa.Integer(), nullable=True),
    sa.Column('broker_currency', sa.String(), nullable=True),
    sa.Column('broker_asset_allocation_percentage', sa.Integer(), nullable=True),
    sa.Column('risk_profile_id', sa.Integer(), nullable=True),
    sa.Column('risk_profile_name', sa.String(), nullable=True),
    sa.Column('risk_profile_acculated_pnl_amount', sa.Float(), nullable=True),
    sa.Column('risk_profile_acculated_pnl_percentage', sa.Integer(), nullable=True),
    sa.Column('risk_profile_acculated_pnl_currency', sa.String(), nullable=True),
    sa.Column('risk_profile_acculated_in_amount', sa.Integer(), nullable=True),
    sa.Column('risk_profile_currency', sa.String(), nullable=True),
    sa.Column('risk_profile_asset_allocation_percentage', sa.Integer(), nullable=True),
    sa.Column('group_id', sa.Integer(), nullable=True),
    sa.Column('group_name', sa.String(), nullable=True),
    sa.Column('group_acculated_pnl_amount', sa.Float(), nullable=True),
    sa.Column('group_acculated_pnl_percentage', sa.Integer(), nullable=True),
    sa.Column('group_acculated_pnl_currency', sa.String(), nullable=True),
    sa.Column('group_acculated_in_amount', sa.Integer(), nullable=True),
    sa.Column('group_currency', sa.String(), nullable=True),
    sa.Column('group_asset_allocation_percentage', sa.Integer(), nullable=True),
    sa.Column('strategy_id', sa.Integer(), nullable=True),
    sa.Column('strategy_name', sa.String(), nullable=True),
    sa.Column('strategy_acculated_pnl_amount', sa.Float(), nullable=True),
    sa.Column('strategy_acculated_pnl_percentage', sa.Integer(), nullable=True),
    sa.Column('strategy_acculated_pnl_currency', sa.String(), nullable=True),
    sa.Column('strategy_acculated_in_amount', sa.Integer(), nullable=True),
    sa.Column('strategy_currency', sa.String(), nullable=True),
    sa.Column('strategy_asset_allocation_percentage', sa.Integer(), nullable=True),
    sa.Column('created_at', sa.DateTime(), nullable=True),
    sa.Column('timestamp', sa.TIMESTAMP(), nullable=True),
    sa.ForeignKeyConstraint(['account_id'], ['account.id'], ),
    sa.ForeignKeyConstraint(['broker_id'], ['broker.id'], ),
    sa.ForeignKeyConstraint(['group_id'], ['at_group.id'], ),
    sa.ForeignKeyConstraint(['risk_profile_id'], ['risk_profile.id'], ),
    sa.ForeignKeyConstraint(['strategy_id'], ['strategy.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.alter_column('order_log', 'broker_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    op.alter_column('order_log', 'profile_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    op.alter_column('order_log', 'group_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    op.alter_column('order_log', 'strategy_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    op.alter_column('order_log', 'order_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('order_log', 'order_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.alter_column('order_log', 'strategy_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.alter_column('order_log', 'group_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.alter_column('order_log', 'profile_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.alter_column('order_log', 'broker_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.drop_table('account_operation')
    # ### end Alembic commands ###