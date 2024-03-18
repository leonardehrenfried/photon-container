FROM docker.io/eclipse-temurin:21

WORKDIR /photon/

ENV PHOTON_LANGUAGES=de,en,fr

ADD https://github.com/komoot/photon/releases/download/0.5.0/photon-0.5.0.jar /photon/photon.jar

COPY entrypoint.sh /photon/

ENTRYPOINT /photon/entrypoint.sh


