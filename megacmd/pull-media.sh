#!/bin/bash
# check required variables have been set
if [ -z ${SRC_FOLDER+x} ]; then
  echo "Error: SRC_FOLDER is not set. Exiting."
  exit 1
fi

for SUBFOLDER in "movies" "tv_shows" "videos"; do
  # ensure source and destination folders have the necessary subdirectories
  if ! mega-ls "${SRC_FOLDER}" | grep -q ^${SUBFOLDER}$; then
    mega-mkdir "${SRC_FOLDER}/${SUBFOLDER}"
  fi
  mkdir /mega-out/${SUBFOLDER}

  # fetch any new files. grep -v : strips the root directory out of the file list.
  NUM_FILES=$(mega-ls "${SRC_FOLDER}/${SUBFOLDER}" | grep -v : | wc -l)
  mega-ls "${SRC_FOLDER}/${SUBFOLDER}" | grep -v : | while read -r FILE; do
    echo "Processing: ${SRC_FOLDER}/${SUBFOLDER}/${FILE}" >>/var/log/cron.log
    mega-get "${SRC_FOLDER}/${SUBFOLDER}/${FILE}" /temp-data
    mv "/temp-data/${FILE}" /mega-out/${SUBFOLDER}
    mega-rm "${SRC_FOLDER}/${SUBFOLDER}/${FILE}"
  done

  # Run tmm if movies or tv_shows and there were new files
  if test $NUM_FILES != "0" && test $SUBFOLDER = "movies"; then
    /root/tinyMediaManager/tinyMediaManager movie -u -n -r
  fi
  if test $NUM_FILES != "0" && test $SUBFOLDER = "tv_shows"; then
    /root/tinyMediaManager/tinyMediaManager tvshow -u -n -r
  fi
done
