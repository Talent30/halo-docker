FROM adoptopenjdk/openjdk11-openj9:alpine-jre

VOLUME /tmp

ARG PORT=8090
ARG TIME_ZONE=UTC

ENV TZ=${TIME_ZONE}
ENV JVM_XMS="256m"
ENV JVM_XMX="256m"

RUN apk -U upgrade --no-cache \
    && mkdir /cache \
    && wget https://github.com/halo-dev/halo/releases/download/v1.0.3/halo-1.0.3.jar -O halo.jar


EXPOSE ${PORT}

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","Xshareclasses:cacheDir=/cache","-Xfuture","-Xtune:virtualized","-jar","halo.jar"]
