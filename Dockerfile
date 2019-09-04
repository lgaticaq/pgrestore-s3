FROM postgres:10.4-alpine@sha256:c1b2e410c5c21b0dea439ec30ceda763c8432d6f0faefa6e638c3addc61e3a33

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD ["/restore.sh"]
