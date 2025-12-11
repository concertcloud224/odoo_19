FROM odoo:19

USER root

# (Optional) install extra libs here
# RUN pip3 install something

USER odoo

# No need for custom workdir

CMD ["odoo", "--http-port=8069"]
