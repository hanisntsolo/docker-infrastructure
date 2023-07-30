FROM mongo

RUN apt-get update     && apt-get install -y gnupg curl     && curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-archive-keyring.gpg     && echo deb [ signed-by=/usr/share/keyrings/mongodb-archive-keyring.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/4.4 multiverse | tee /etc/apt/sources.list.d/mongodb-org-4.4.list     && apt-get update     && apt-get install -y mongodb-org-tools

