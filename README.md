# Mega - TMM - Docker

A bespoke application for automatically pulling media files from a Mega folder, tagging them with TinyMediaManager, and alerting Kodi to scan for new content.

## Prerequisites

- LibreElec
- Docker plugin
- docker-compose (not with libreelec by default)
- A Mega account

## Installation

- pull repo into LibreElec
- create root directories for media files on Mega and locally
- set env variables
- docker-compose

## Usage

- Config: SRC_DIR, DEST_DIR
- Supply Mega session file? Or exec and login?

- place media in Mega in folder, according to type (movies / tv_shows / videos)
- media will be pulled, and if movies or tv it will be processed by tmm

## Q&A

- why does this exist? fun
- I don't want all this fluff but I do want Mega-CMD / TMM available on my librelec machine, do you have a repo for that? tmm has a docker image. will make a simple repo for mega-cmd.
- It isn't working, what do I do? logs
- Can I give you money? no

## TODOs

- [ ] Alert Kodi to update once new files have been scraped
- [ ] Add repository for mega-cmd only docker image
- [ ] Only run mega-mkdir commands if the folder doesn't exist
- [ ] Only run TMM scraping when new movie / tv files have been pulled
