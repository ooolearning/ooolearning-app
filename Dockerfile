FROM dart:2.19.1 as builder

RUN apt-get update && apt-get install -y unzip wget xz-utils

WORKDIR /usr

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH "$PATH:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"

RUN flutter upgrade

# Install webdev
RUN flutter pub global activate webdev

# Set the PATH environment variable for the webdev executable
ENV PATH "$PATH:/root/.pub-cache/bin"

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
