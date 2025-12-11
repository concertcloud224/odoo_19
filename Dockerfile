FROM odoo:19

# (agar tumhein extra Python libs ya custom addons copy karne hon
#  to yahan USER root karke apt/pip install kar sakte ho)

USER root
# yahan apne custom packages / addons waqera install karo
# example:
# COPY ./addons /mnt/extra-addons

# non-root user bana ke usi se Odoo run karna
RUN useradd -m odoo && mkdir -p /var/lib/odoo /var/log/odoo && \
    chown -R odoo /var/lib/odoo /var/log/odoo /usr/lib/python3 /etc/odoo || true

USER odoo
WORKDIR /usr/lib/python3/dist-packages/odoo  # ya jahan odoo-bin hai

# ENV sirf reference ke liye, Odoo env se hi read karega
ENV DB_HOST=${DB_HOST} \
    DB_PORT=${DB_PORT} \
    DB_USER=${DB_USER} \
    DB_PASSWORD=${DB_PASSWORD} \
    DB_NAME=${DB_NAME}

# IMPORTANT: koi --disable-root-warning ya extra unknown option NA ho
CMD ["python3", "odoo-bin", "--http-port=8069", "--db_host=${DB_HOST}", "--db_port=${DB_PORT}", "--db_user=${DB_USER}", "--db_password=${DB_PASSWORD}"]
