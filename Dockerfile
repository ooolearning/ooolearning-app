FROM ubuntu:20.04 as builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git wget unzip fonts-droid-fallback python3
RUN apt-get clean

RUN apt-get update && apt-get install -y build-essential
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

WORKDIR /usr/local/flutter

RUN flutter channel master

# RUN flutter upgrade
RUN git checkout f9972818f4e8bf464b378f0942a153fa391a0b7a

RUN flutter config --enable-web

WORKDIR /app

COPY . .

RUN flutter pub get

# Build the Flutter application for the web
RUN flutter build web --release

FROM nginx:alpine as runner

COPY --from=builder /app/build/web /app/static

RUN chmod -R 777 /app/static

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
