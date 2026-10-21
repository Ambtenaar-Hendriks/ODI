[private]
default:
    @just --list

# Start de ontwikkelserver op http://localhost:1313
up:
    cd sites/odi && hugo server --baseURL http://localhost:1313/ --appendPort=false

# Bouw de site naar public/
build:
    rm -rf public && cd sites/odi && hugo --minify --destination ../../public
