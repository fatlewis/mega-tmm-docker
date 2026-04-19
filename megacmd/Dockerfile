FROM ubuntu:latest

WORKDIR /root

# Install mega-cmd
RUN apt-get update && apt-get install -y curl \
    && curl -O https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megacmd-xUbuntu_24.04_amd64.deb \
    && apt-get install -y "$PWD/megacmd-xUbuntu_24.04_amd64.deb" \
    && rm "$PWD/megacmd-xUbuntu_24.04_amd64.deb"

# Need to set machine-id to avoid this bug https://github.com/meganz/MEGAcmd/issues/623
RUN apt-get install -y dbus && dbus-uuidgen > /etc/machine-id 

# Job to scan for new files and download when available
# Copy scan script
COPY pull-media.sh /usr/bin/pull-media.sh
RUN chmod 0744 /usr/bin/pull-media.sh
# Install cron
RUN apt-get -y install cron
# Copy cron job
COPY pull-media-cron /etc/cron.d/pull-media-cron
RUN chmod 0744 /etc/cron.d/pull-media-cron
RUN crontab /etc/cron.d/pull-media-cron
RUN touch /var/log/cron.log
# Copy cron start script
COPY start-cron.sh /usr/bin/start-cron.sh
RUN chmod 0744 /usr/bin/start-cron.sh

# Purge apt libraries
RUN rm -rf /var/lib/apt/lists/*

# Run cron and mega-cmd (note: if cron dies the docker container will keep running)
CMD ["sh", "-c", "/usr/bin/start-cron.sh && mega-cmd-server"]
