FROM odoo:19

# Future me agar kuch install karna ho to yahan kar sakte ho
USER root
# (optional) yahan apt/pip install kara sakte ho
# RUN apt-get update && apt-get install -y xyz

# Wapas odoo user pe
USER odoo

# MAIN COMMAND – env vars ko shell expand karega
CMD odoo \
    --http-port=8069 \
    --db_host="$DB_HOST" \
    --db_port="$DB_PORT" \
    --db_user="$DB_USER" \
    --db_password="$DB_PASSWORD" \
    -d "$DB_NAME"
