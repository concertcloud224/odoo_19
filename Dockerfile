# FROM odoo:19

# Agar future me kuch extra libs install karni hongi to root se kar sakte ho
# USER root
# (optional) yahan apt/pip install kara sakte ho

# Wapas odoo user pe aao
# USER odoo

# MAIN COMMAND – yeh /usr/bin/odoo use karega (image ke andar ka sahi binary)
# CMD python3 /usr/bin/odoo \
#    --http-port=8069 \
 #   --db_host="${DB_HOST}" \
#    --db_port="${DB_PORT}" \
#    --db_user="${DB_USER}" \
 #   --db_password="${DB_PASSWORD}" \
 #   -d "${DB_NAME}"
