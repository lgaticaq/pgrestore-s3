FROM postgres:10.1-alpine@sha256:a91afc88ea22cd33c74f9dadd6732a2841f9a2ba4f5bf15a0f29fb0b8cecf790

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
