FROM multiarch/alpine:arm64-latest-stable

VOLUME /tmp

ARG PORT=8090
ARG TIME_ZONE=UTC

ENV TZ=${TIME_ZONE}

RUN apk add --no-cache openjdk11-jre-headless \
    && wget https://github.com/halo-dev/halo/releases/download/v1.1.1/halo-1.1.1.jar -O halo.jar


EXPOSE ${PORT}
USER nobody
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Xtune:virtualized","-Xshareclasses:cacheDir=/opt/shareclasses","-XX:+UseGCStartupHints","-jar","halo.jar"]
