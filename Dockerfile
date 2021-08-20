FROM tensorflow/tensorflow:latest-jupyter

ENV PACKAGES="\
    git \
"

ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y --no-install-recommends $PACKAGES \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
    && apt-get install -y python3-opencv

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
