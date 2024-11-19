FROM maven:3.9.8-eclipse-temurin-22-alpine
LABEL maintainer="Nícolas Basilio"

ENV PNPM_HOME="/pnpm"
ENV PATH="${PNPM_HOME}:${PATH}"

RUN apk add nodejs-current=21.7.3-r0 --no-cache && \
	corepack enable pnpm && \
	corepack use pnpm@latest-9 && \
	pnpm config set store-dir .pnpm-store && \
	pnpm i firebase-tools -g && \
	mkdir -p /home/node/app

COPY app /home/node/app
COPY cmd /home/node/app/cmd

WORKDIR /home/node/app
CMD [ "./cmd/run.sh" ]

