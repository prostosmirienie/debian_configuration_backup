#!/bin/bash

CONFIGURTION_BACKUP_DIR_NAME="`date '+%Y-%m-%d_%H-%M'`_configuration_backup"
mkdir ${CONFIGURTION_BACKUP_DIR_NAME}
dpkg --get-selections > ${CONFIGURTION_BACKUP_DIR_NAME}/_dpkg_get_selections.bkp
rsync -av --delete /etc/ ${CONFIGURTION_BACKUP_DIR_NAME}/etc_copy/
