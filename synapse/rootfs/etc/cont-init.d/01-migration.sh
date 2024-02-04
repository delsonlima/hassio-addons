#!/usr/bin/with-contenv bashio

declare data_dir
declare older_data_dir

data_dir="/config"
config_data_dir="$(bashio::config 'data_dir')"
older_data_dir="$(echo "$config_data_dir" | sed -e 's/^\/config/\/homeassistant/')"
older_data_dir="${older_data_dir:-"/homeassistant/addons_config/synapse"}"

bashio::log.info "Checking for pending migration..."

if [ -d "${older_data_dir}" ] && [ "${config_data_dir}" != "${data_dir}" ]; then
    bashio::log.info "Older data dir found, starting migration..."

    bashio::log.info "Moving data to new config folder..."
    mv "${older_data_dir}"/* "${data_dir}" || (bashio::log.fatal "Could not move data to new directory!" && exit 1)

    bashio::log.info "Removing older data folder..."
    rm -r "${older_data_dir}" || bashio::log.warning "Could not remove older config dir!"

    bashio::log.info "Updating config files with new path..."
    sed -i "s|$(bashio::config 'data_dir')|${data_dir}|g" "${data_dir}"/config/*

    bashio::log.info "Migration terminated!"
else
    bashio::log.info "No migration needed, skipping..."
fi
