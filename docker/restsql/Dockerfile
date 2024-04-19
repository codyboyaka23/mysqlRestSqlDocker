FROM restsql/service

ARG SHARED_USER
ARG SHARED_GROUP
ARG SHARED_UID
ARG SHARED_GID

RUN apk update \
    && apk add nano \
    && apk add sudo
RUN addgroup -g $SHARED_GID $SHARED_GROUP \
    && adduser -G $SHARED_GROUP -u $SHARED_UID -g "" -H -D $SHARED_USER \
    && echo $SHARED_USER:cara55I0 | chpasswd \
    && addgroup $SHARED_USER wheel
