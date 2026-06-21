#!/bin/sh

mkdir -p /logs
CRON_LOG=/logs/amber-monthly.log
DATE=$(date +%Y-%m-%d" "%H:%M:%S)

echo "### amber-monthly at: ${DATE} ###" >> ${CRON_LOG}
curl -s -X POST -H "x-access-token: ${APP_API_KEYS}" -H "Content-Type: application/json" -d '{"type": "participants-summary"}' ${AMBER_URL}/task >> ${CRON_LOG} 2>&1
echo "" >> ${CRON_LOG}
