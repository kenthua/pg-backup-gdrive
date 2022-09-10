FROM alpine

RUN apk update && apk add postgresql-client curl file
RUN curl --compressed -Ls https://github.com/labbots/google-drive-upload/raw/master/install.sh | sh -s
#RUN ${HOME}/.google-drive-upload/bin/gupload --update
