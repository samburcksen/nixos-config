#!/usr/bin/env bash

pkill waybar

conf_dir=~/.config/waybar
current_conf=$(readlink ${conf_dir}/config.jsonc)

if [[ $current_conf = ${conf_dir}/config_detailed.jsonc ]]; 
then
    ln -sf ${conf_dir}/config_default.jsonc ${conf_dir}/config.jsonc
    ln -sf ${conf_dir}/style_default.css ${conf_dir}/style.css
else
    ln -sf ${conf_dir}/config_detailed.jsonc ${conf_dir}/config.jsonc
    ln -sf ${conf_dir}/style_detailed.css ${conf_dir}/style.css
fi

waybar
