#!/usr/bin/with-contenv bashio

bashio::log.info "Checking Synapse configuration..."

CONF_DATA_DIR="/config"
SERVER_NAME="$(bashio::config 'server_name')"
REPORT_STATS="$(bashio::config 'report_stats')"

CONFIG_DIR="${CONF_DATA_DIR}/config"
DATA_DIR="${CONF_DATA_DIR}/data"
LOG_DIR="${DATA_DIR}/logs"

SERVER_CONFIG_FILE="${CONFIG_DIR}/homeserver.yaml"
LOG_CONFIG_FILE="${CONFIG_DIR}/${SERVER_NAME}.log.config"
LOG_FILE="${LOG_DIR}/${SERVER_NAME}.log"
ENABLE_STATS=$([ "$REPORT_STATS" = true ] && echo "yes" || echo "no")

mkdir -p "${CONFIG_DIR}"
mkdir -p "${DATA_DIR}"
mkdir -p "${LOG_DIR}"

if [ -f "${SERVER_CONFIG_FILE}" ]; then
    bashio::log.info "Existing Synapse configuration found!"
else
    bashio::log.info "No existing Synapse configuration found!"
    bashio::log.info "Generating Synapse configuration..."

    /usr/bin/generate_log_config           \
        --output-file "${LOG_CONFIG_FILE}" \
        --log-file "${LOG_FILE}"

    /usr/bin/synapse_homeserver \
        --config-path      "${SERVER_CONFIG_FILE}" \
        --generate-config                          \
        --server-name      "${SERVER_NAME}"        \
        --report-stats     "${ENABLE_STATS}"       \
        --config-directory "${CONFIG_DIR}"         \
        --data-directory   "${DATA_DIR}"
fi
