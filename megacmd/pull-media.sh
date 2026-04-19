# check required variables have been set
if ! [ -v MEGA_IN_FOLDER ]; then echo "Error: MEGA_IN_FOLDER is not set. Exiting."; exit 1; fi 
if ! [ -v MEGA_OUT_FOLDER ]; then echo "Error: MEGA_OUT_FOLDER is not set. Exiting."; exit 1; fi

# check if any files have been added
mega-ls "$MEGA_IN_FOLDER" | while read -r FILE; do
        echo "Processing: ${MEGA_IN_FOLDER}/${FILE}" >> /var/log/cron.log
        mega-get "${MEGA_IN_FOLDER}/${FILE}" /temp-data
        mv /temp-data/${FILE} /mega-out/${FILE}
        mega-mv "${MEGA_IN_FOLDER}/${FILE}" "${MEGA_OUT_FOLDER}"
done
