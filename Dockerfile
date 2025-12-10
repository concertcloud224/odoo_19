FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

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
COPY . /app

RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r requirements.txt

# 👉 yahan non-root user bana ke use par switch kar rahe hain
RUN useradd -m odoo && chown -R odoo /app
USER odoo

CMD ["bash", "-c", "python odoo-bin \
    --http-port=$PORT \
    --http-interface=0.0.0.0 \
    --db_host=$DB_HOST \
    --db_port=$DB_PORT \
    --db_user=$DB_USER \
    --db_password=$DB_PASSWORD"]
