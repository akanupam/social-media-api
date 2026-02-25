# FastAPI Social Media API

A modern REST API built with **FastAPI** for managing posts, users, authentication, and voting. Uses **PostgreSQL** with **SQLAlchemy** ORM and **JWT** token-based authentication with OAuth2.

## Tech Stack

- **FastAPI**: High-performance async web framework
- **SQLAlchemy**: ORM for database operations
- **PostgreSQL**: Relational database
- **psycopg2**: PostgreSQL adapter
- **python-jose**: JWT token generation and validation
- **Alembic**: Database version control and migrations
- **CORS Middleware**: Cross-origin resource sharing
- **Pydantic**: Data validation and schema definitions

## Features

✅ User authentication with JWT tokens  
✅ Create, read, update, delete posts  
✅ User registration and management  
✅ Voting system on posts with cascade deletion  
✅ Database migrations with Alembic  
✅ CORS support for frontend integration  
✅ SQLAlchemy relationships (Post→User, Vote→User/Post)  

## Project Structure

```
app/
├── app.py          # Main application entry point
├── models.py       # SQLAlchemy models (Post, User, Vote)
├── database.py     # Database configuration and session management
├── schemas.py      # Pydantic validation schemas
├── oauth2.py       # JWT token creation and verification
├── config.py       # Environment configuration
├── utils.py        # Helper functions
└── routers/        # API endpoints
    ├── auth.py     # Authentication endpoints (login, token)
    ├── posts.py    # Post CRUD operations
    ├── users.py    # User management
    └── vote.py     # Voting endpoints
```

## Configuration

Set environment variables in `.env`:
- `DATABASE_HOSTNAME`: PostgreSQL host
- `DATABASE_PORT`: PostgreSQL port
- `DATABASE_USERNAME`: Database user
- `DATABASE_PASSWORD`: Database password
- `DATABASE_NAME`: Database name
- `SECRET_KEY`: JWT secret key
- `ALGORITHM`: JWT algorithm (HS256)
- `ACCESS_TOKEN_EXPIRE_MINUTES`: Token expiration time

## Setup Instructions

1. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Configure database**:
   - Create PostgreSQL database
   - Set environment variables

3. **Run migrations**:
   ```bash
   alembic upgrade head
   ```

4. **Start development server**:
   ```bash
   uvicorn app.app:app --reload
   ```

Server runs at `http://localhost:8000`

## API Endpoints Overview

- `POST /auth/login` - User login
- `POST /users/` - Register new user
- `GET/POST /posts` - Get all posts / Create post
- `GET /posts/{id}` - Get specific post
- `PUT /posts/{id}` - Update post
- `DELETE /posts/{id}` - Delete post
- `POST /votes` - Vote on post

## Database Models

- **User**: Email, password, timestamps
- **Post**: Title, content, owner reference, publish status, timestamps
- **Vote**: Composite key (user_id, post_id) with cascade deletion

All models use server-side defaults for timestamps and include proper foreign key constraints.
