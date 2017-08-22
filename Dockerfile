FROM ubuntu:17.04
LABEL maintainer="James Turner"

CMD ["./mach", "build"]

ENV SHELL /bin/bash

ENV PATH="/root/.cargo/bin:${PATH}"

RUN apt-get update && \
    apt-get install -y wget python clang llvm

RUN wget -q https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py -O /tmp/bootstrap.py

RUN python /tmp/bootstrap.py --application-choice=browser --no-interactive

RUN mkdir -p /usr/local/src/firefox

WORKDIR /usr/local/src/firefox
