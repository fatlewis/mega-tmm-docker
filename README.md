# Mega - TMM - Docker

A bespoke application for automatically pulling media files from a Mega folder, tagging them with TinyMediaManager, and alerting Kodi to scan for new content.

## Prerequisites

### Raspberry Pi with LibreELEC

- A Raspberry Pi
- LibreELEC OS
- The Docker plugin for Kodi
- Docker-Compose (this does not come with LibreElec by default)
- A Mega account

### Other Systems

Other systems are not officially supported, but the application ought to work if you have both Docker and a Mega account. Kodi is optional. It should be possible to alert Kodi using a pipe file, if your system supports this.

## Installation

- pull repo into LibreElec
- create root directories for media files on Mega and locally
- create fifo pipe file for alerting Kodi (optional)
- add script to alert Kodi once pipe file is changed (optional)
- set env variables
- docker-compose
- log in to mega using exec

## Usage

- place media in Mega in folder, according to type (movies / tv_shows / videos)
- media will be pulled, and if movies or tv it will be processed by tmm
- if a pipe file has been configured, Kodi should automatically update the relevant library

## Q&A

**Q: Why does this project exist?**

**A:** Fun

**Q: I don't want all this fluff but I do want Mega-CMD / TMM available on my librelec machine, do you have a repo for that?**

**A:** tmm has a docker image. will make a simple repo for mega-cmd at some point.

**Q: It isn't working, what do I do?**

**A:** Look at the logs

**Q: Can I give you money?**

**A:** no

## TODOs

- [ ] Alert Kodi to update once new files have been scraped
- [ ] Add repository for mega-cmd only docker image
- [ ] Fix issues with tv shows, tinyMediaManager requires that episodes be placed within a show directory rather than at root
