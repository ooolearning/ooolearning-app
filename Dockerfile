FROM ubuntu:20.04 as builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

FROM nginx:alpine as runner

COPY --from=builder /app/build/web /app/static

RUN chmod -R 777 /app/static

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
