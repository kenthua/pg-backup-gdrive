BACKUP_DATE=$(date +"%Y%m%d-%H%M")
#echo "${DATABASE_HOST}:${DATABASE_PORT}:${DATABASE_NAME}:${DATABASE_USERNAME}:${DATABASE_PASSWORD}" > ${HOME}/.pgpass
echo "*:*:*:${DATABASE_USERNAME}:${DATABASE_PASSWORD}" > ${HOME}/.pgpass
chmod 0600 ${HOME}/.pgpass
pg_dumpall -h ${DATABASE_HOST} -U ${DATABASE_USERNAME} > ${DB_BACKUP_FILE}-${BACKUP_DATE}

tar -czf /${DB_BACKUP_FILE}-${BACKUP_DATE}.tar.gz /${DB_BACKUP_FILE}-${BACKUP_DATE}

cat << EOF > ${HOME}/.googledrive.conf
ACCOUNT_main_CLIENT_ID="${ACCOUNT_CLIENT_ID}"
ACCOUNT_main_CLIENT_SECRET="${ACCOUNT_CLIENT_SECRET}"
ACCOUNT_main_REFRESH_TOKEN="${ACCOUNT_REFRESH_TOKEN}"
ACCOUNT_main_ROOT_FOLDER="${ACCOUNT_ROOT_FOLDER}"
DEFAULT_ACCOUNT="${DEFAULT_ACCOUNT}"
ACCOUNT_main_ROOT_FOLDER_NAME="${ACCOUNT_ROOT_FOLDER_NAME}
EOF

${HOME}/.google-drive-upload/bin/gupload /${DB_BACKUP_FILE}-${BACKUP_DATE}.tar.gz
