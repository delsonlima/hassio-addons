#!/usr/bin/with-contenv bashio

CONFIG_DATA_DIR="$(bashio::config 'data_dir')"
DATA_DIR="${CONFIG_DATA_DIR:-"/config"}"
CONFIG_DIR="${DATA_DIR}/config"
SERVER_CONFIG_FILE="${CONFIG_DIR}/homeserver.yaml"
LOG_CONFIG_FILE=$(yq '.log_config' "${SERVER_CONFIG_FILE}")

bashio::log.info "Applying Synapse Settings..."

yq eval '.listeners[0].bind_addresses = ["0.0.0.0"]' -i "${SERVER_CONFIG_FILE}"
yq eval '.root.handlers = ["console", "buffer"]' -i "${LOG_CONFIG_FILE}"
