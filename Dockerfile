FROM postgres:10.1-alpine@sha256:2d82b87583b061f594780a2dff4359ccc26fb599fca5563b6e919ab5e234a17d

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
