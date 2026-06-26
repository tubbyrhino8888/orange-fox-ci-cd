FROM node:24-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-4-1 \
    libnss3 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

RUN npm i -g pm2
COPY package.json package-lock.json .
RUN npm ci

COPY app.js test.config.js dev.config.js prod.config.js .

COPY spec spec
COPY src src