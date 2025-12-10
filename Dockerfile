FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

# System dependencies for Odoo
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy Odoo source
COPY . /app

# Install Python deps
RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r requirements.txt

# Default command for Railway – use PORT env var
CMD ["bash", "-c", "python odoo-bin --http-port=$PORT --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD"]
