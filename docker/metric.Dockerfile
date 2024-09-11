ARG VERSION=v0.3.0

FROM lmsysorg/sglang:${VERSION}-cu121

RUN pip install --no-cache-dir prometheus_fastapi_instrumentator

RUN apt-get update && apt-get install -y git && apt-get clean

# since it use editable install, we need to copy the file to the right place
COPY ./python/sglang/srt/server.py /sgl-workspace/sglang/python/sglang/srt/server.py

#COPY ./python/sglang/srt/server.py /tmp/server.py

#RUN mv /tmp/server.py $(pip show sglang | grep Location | awk '{print $2}')/sglang/srt/server.py

ENV ENABLE_METRICS=1