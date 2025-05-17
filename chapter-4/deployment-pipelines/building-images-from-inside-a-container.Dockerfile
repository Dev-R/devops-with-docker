FROM docker:25-git

WORKDIR /app

COPY . .

RUN chmod +x /app/builder.sh

ENTRYPOINT ["/bin/sh", "/app/builder.sh"]