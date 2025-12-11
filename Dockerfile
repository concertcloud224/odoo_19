FROM odoo:19

USER root

# Optional: extra libs
# RUN pip3 install something

USER odoo

CMD /usr/bin/odoo \
    --http-port=8069 \
    --db_host="$DB_HOST" \
    --db_port="$DB_PORT" \
    --db_user="$DB_USER" \
    --db_password="$DB_PASSWORD" \
    -d "$DB_NAME"
