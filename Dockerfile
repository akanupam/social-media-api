FROM python:3.9.7-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["fastapi", "run", "app/app.py", "--host", "0.0.0.0", "--port", "8000"]

