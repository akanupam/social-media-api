FROM python:3.11.9-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "alembic upgrade head 2>/dev/null || true && fastapi run app/app.py --host 0.0.0.0 --port 8000"]

CMD ["sh", "-c", "alembic upgrade head && fastapi run app/app.py --host 0.0.0.0 --port 8000"]

