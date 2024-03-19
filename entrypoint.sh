#!/bin/bash -e

DATA_DIR="/photon"
ES_DIR="${DATA_DIR}/photon_data/elasticsearch"

if [ ! -d "$ES_DIR" ]; then

  echo "Photon data directory doesn't exist. Starting import."

  java -jar photon.jar \
        -nominatim-import \
        -host      "$NOMINATIM_DB_HOST" \
        -port      "$NOMINATIM_DB_PORT" \
        -user      "$NOMINATIM_DB_USER" \
        -password  "$NOMINATIM_DB_PASSWORD" \
        -languages "$PHOTON_LANGUAGES" \
        -data-dir  "$DATA_DIR"
  echo
  echo 'Photon init process complete; ready for start up.'
  echo

fi

java -jar photon.jar \
        --nominatim-update-init-for "$NOMINATIM_DB_USER" \
        -host      "$NOMINATIM_DB_HOST" \
        -port      "$NOMINATIM_DB_PORT" \
        -user      "$NOMINATIM_DB_USER" \
        -password  "$NOMINATIM_DB_PASSWORD" \
        -languages "$PHOTON_LANGUAGES" \
        -data-dir  "$DATA_DIR"

java -jar photon.jar -cors-any -data-dir "$DATA_DIR" -languages "$PHOTON_LANGUAGES" "$@"

