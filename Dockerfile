FROM odoo:19

# Agar tumhein koi extra packages waghera install karne hon
# to yahan USER root karke apt/pip use kar sakte ho
USER root
# example:
# RUN pip3 install some-lib
# COPY ./addons /mnt/extra-addons

# Ab wapis Odoo ka normal user use karein
USER odoo

# Odoo ka kaam karne wala folder
WORKDIR /usr/lib/python3/dist-packages/odoo

# DB_* env vars Railway se aa jayenge,
# Odoo khud environment se read karega, CLI se pass karne ki zaroorat nahi
# Isliye simple CMD rakho
CMD ["python3", "odoo-bin", "--http-port=8069"]
