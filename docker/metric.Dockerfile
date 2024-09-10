ARG VERSION=v0.6.0

FROM lmsysorg/sglang:${VERSION}-cu121

RUN pip install --no-cache-dir prometheus_fastapi_instrumentator

RUN apt-get update && apt-get install -y git && apt-get clean

COPY ./python/sglang/srt/server.py /tmp/server.py

RUN mv /tmp/server.py $(pip show sglang | grep Location | awk '{print $2}')/sglang/srt/server.py

ENV ENABLE_METRICS=1