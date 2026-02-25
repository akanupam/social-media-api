"""add content column to posts table

Revision ID: 8d18ad6810fe
Revises: 00287a07c0d9
Create Date: 2026-02-25 00:47:35.386482

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '8d18ad6810fe'
down_revision: Union[str, Sequence[str], None] = '00287a07c0d9'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.add_column('posts', sa.Column('content', sa.String(), nullable=False))
    pass


def downgrade() -> None:
    """Downgrade schema."""
    op.drop_column('posts', 'content')
    pass
