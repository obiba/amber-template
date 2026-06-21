#!/bin/bash
set -e
mkdir -p /logs
# Snapshot current env vars into a sourceable file so cron jobs inherit them
export -p > /tmp/cron-env.sh
{ echo "SHELL=/bin/bash"; echo "${CRON_SCHEDULE} . /tmp/cron-env.sh && /bin/bash ${CRON_SCRIPT} >/dev/null 2>&1"; } | crontab -
exec cron -f
