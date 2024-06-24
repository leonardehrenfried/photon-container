FROM docker.io/eclipse-temurin:21

WORKDIR /photon/

ENV PHOTON_LANGUAGES=de,en,fr
ENV NOMINATIM_DB_USER=nominatim
ENV NOMINATIM_DB_PORT=5432

ADD https://github.com/komoot/photon/releases/download/0.5.0/photon-0.5.0.jar /photon/photon.jar

COPY entrypoint.sh /photon/
COPY update.sh /photon/
COPY synonyms.json /photon/

ENTRYPOINT /photon/entrypoint.sh


