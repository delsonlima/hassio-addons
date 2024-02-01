#!/usr/bin/with-contenv bashio

declare older_data_dir

older_data_dir="$(bashio::config 'data_dir' | sed -e 's/^\/config/\/homeassistant/')"
older_data_dir=${older_data_dir:-"/homeassistant/addons_config/synapse"}

bashio::log.info "Checking for pending migration..."

if [ -d "$older_data_dir" ]; then
    bashio::log.info "Older data dir found, starting migration..."

    mv "${older_data_dir}"/* /config || (bashio::log.fatal "Could not move data to new directory!" && exit 1)
    rm -r "${older_data_dir}" || bashio::log.warning "Could not remove older config dir!"

    bashio::log.info "Migration terminated!"
else
    bashio::log.info "No migration needed, skipping..."
fi
