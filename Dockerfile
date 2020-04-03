# 18.04 is a LTS release
FROM ubuntu:18.04
LABEL maintainer="James Turner"
LABEL contributors="Pierre Roudier"

ENV SHELL /bin/bash
ENV PATH "/root/.cargo/bin:${PATH}"
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y wget python3 

WORKDIR /src
RUN ./mach bootstrap --application-choice=browser --no-interactive

CMD ["./mach", "build"]
