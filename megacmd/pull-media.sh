# check required variables have been set
if [ -z ${MEGA_IN_FOLDER+x} ]; then
  echo "Error: MEGA_IN_FOLDER is not set. Exiting."
  exit 1
fi
if [ -z ${MEGA_OUT_FOLDER+x} ]; then
  echo "Error: MEGA_OUT_FOLDER is not set. Exiting."
  exit 1
fi

# check if any files have been added
mega-ls "$MEGA_IN_FOLDER" | while read -r FILE; do
  echo "Processing: ${MEGA_IN_FOLDER}/${FILE}" >>/var/log/cron.log
  mega-get "${MEGA_IN_FOLDER}/${FILE}" /temp-data
  mv /temp-data/${FILE} /mega-out
  mega-mv "${MEGA_IN_FOLDER}/${FILE}" "${MEGA_OUT_FOLDER}"
done
