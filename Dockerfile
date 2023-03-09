FROM alpine:edge
MAINTAINER Scavin <scavin@appinn.com>

ENV LANG C.UTF-8

RUN apk add --update --no-cache python3-dev gcc musl-dev libmagic ffmpeg
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN pip3 install ehforwarderbot \
    && pip3 install efb-telegram-master \
    && pip3 install efb-wechat-slave

RUN mkdir -p /root/.ehforwarderbot/modules/
RUN wget https://gist.githubusercontent.com/blueset/0084ab142e2213bca50d81d08753e564/raw/8699f4b7007b396ff06493eb3ded34402b19d5d0/filter.py -P /root/.ehforwarderbot/modules/

CMD ["ehforwarderbot"]
