#!/bin/bash -e

DATA_DIR="/photon"
java -jar photon.jar \
        -host      "$NOMINATIM_DB_HOST" \
        -port      "$NOMINATIM_DB_PORT" \
        -user      "$NOMINATIM_DB_USER" \
        -password  "$NOMINATIM_DB_PASSWORD" \
        -data-dir  "$DATA_DIR" \
        -nominatim-update
