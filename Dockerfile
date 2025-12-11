FROM odoo:19

# Agar future me kuch extra libs install karni hongi to root se kar sakte ho
USER root
# (optional) yahan apt/pip install kara sakte ho
# example:
# RUN pip3 install some-extra-lib

# Wapas odoo user pe aao
USER odoo

# MAIN COMMAND – yeh /usr/bin/odoo use karega (image ke andar ka sahi binary)
CMD python3 /usr/bin/odoo \
    --http-port=8069 \
    --db_host="${DB_HOST}" \
    --db_user="${DB_USER}" \
    --db_password="${DB_PASSWORD}" \
    -d "${DB_NAME}"
