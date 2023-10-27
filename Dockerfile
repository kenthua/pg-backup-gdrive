FROM alpine:3.18.4

RUN apk update && apk add postgresql-client curl file && rm -rf /var/cache/apk/*
RUN curl --compressed -Ls https://github.com/labbots/google-drive-upload/raw/master/install.sh | sh -s
#RUN ${HOME}/.google-drive-upload/bin/gupload --update
ADD backup.sh /
