FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends curl cron \
  && rm -rf /var/lib/apt/lists/*
COPY amber-daily.sh /amber-daily.sh
COPY amber-monthly.sh /amber-monthly.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /amber-daily.sh /amber-monthly.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
