# Needed to ensure cron starts with environment variables loaded (see https://stackoverflow.com/questions/27771781)
printenv > /etc/environment
cron
