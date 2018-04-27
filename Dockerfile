FROM postgres:10.3-alpine@sha256:904fdb16d13c78577c26710b31c46a9e5c66db54099bc46a64e7ecf1d9346a63

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD ["/restore.sh"]
