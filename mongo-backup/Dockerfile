FROM mongo
RUN apt-get update && apt-get install -y --no-install-recommends cron \
  && rm -rf /var/lib/apt/lists/*
COPY backup.sh /backup.sh
RUN chmod +x /backup.sh
CMD ["cron", "-f"]
