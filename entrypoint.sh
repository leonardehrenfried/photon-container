#!/bin/bash -e

java -jar photon.jar \
      -nominatim-import \
      -host      $NOMINATIM_DB_HOST \
      -port      $NOMINATIM_DB_PORT \
      -user      $NOMINATIM_DB_USER \
      -password  $NOMINATIM_DB_PASSWORD \
      -languages $PHOTON_LANGUAGES
echo
echo 'Photon init process complete; ready for start up.'
echo

java -jar photon.jar -languages "$PHOTON_LANGUAGES" "$@"

