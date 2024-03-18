FROM docker.io/eclipse-temurin:21

WORKDIR /photon/

ADD https://github.com/komoot/photon/releases/download/0.5.0/photon-0.5.0.jar /photon/photon.jar

ENTRYPOINT entrypoint.sh


