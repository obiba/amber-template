#!/bin/sh

mkdir -p /logs
CRON_LOG=/logs/amber-daily.log
DATE=$(date +%Y-%m-%d" "%H:%M:%S)

echo "### amber-daily at: ${DATE} ###" >> ${CRON_LOG}
curl -s -X POST -H "x-access-token: ${APP_API_KEYS}" -H "Content-Type: application/json" -d '{"type": "participants-info-activate"}' ${AMBER_URL}/task >> ${CRON_LOG} 2>&1
echo "" >> ${CRON_LOG}
curl -s -X POST -H "x-access-token: ${APP_API_KEYS}" -H "Content-Type: application/json" -d '{"type": "participants-activate"}' ${AMBER_URL}/task >> ${CRON_LOG} 2>&1
echo "" >> ${CRON_LOG}
curl -s -X POST -H "x-access-token: ${APP_API_KEYS}" -H "Content-Type: application/json" -d '{"type": "participants-reminder"}' ${AMBER_URL}/task >> ${CRON_LOG} 2>&1
echo "" >> ${CRON_LOG}
curl -s -X POST -H "x-access-token: ${APP_API_KEYS}" -H "Content-Type: application/json" -d '{"type": "participants-info-expire"}' ${AMBER_URL}/task >> ${CRON_LOG} 2>&1
echo "" >> ${CRON_LOG}
curl -s -X POST -H "x-access-token: ${APP_API_KEYS}" -H "Content-Type: application/json" -d '{"type": "participants-deactivate"}' ${AMBER_URL}/task >> ${CRON_LOG} 2>&1
echo "" >> ${CRON_LOG}
