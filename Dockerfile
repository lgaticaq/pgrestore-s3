FROM postgres:10.4-alpine@sha256:c86ab1944c942695f5a412188f5c6daf9e0f51f202e0c7fc4b87a35a8119deb8

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD ["/restore.sh"]
