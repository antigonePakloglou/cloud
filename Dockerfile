FROM debian:buster-slim

RUN apt-get update && apt-get install -y apt-transport-https \
    && apt install postgresql-client -y \
    && apt install postgresql -y \
    && apt-get install -y wget \
    && apt-get install -y gnupg dirmngr \
    && apt-get update -y \
    && wget -O - https://nightly.odoo.com/odoo.key | gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg \
    && echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/16.0/nightly/deb/ ./' | tee /etc/apt/sources.list.d/odoo.list \
    && apt-get update \
    && apt-get install odoo -y

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8069

CMD ["odoo"]

