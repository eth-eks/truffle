FROM trufflesuite/ganache-cli:latest as ganache

FROM node:16.13.1-alpine3.14 as truffle
LABEL org.opencontainers.image.source https://github.com/eth-eks/truffle
WORKDIR /contracts

RUN apk add --no-cache ca-certificates
RUN npm install -g truffle

ADD package.json package-lock.json ./
RUN npm i

COPY --from=ganache /app/ /app/

EXPOSE 8545

ENTRYPOINT ["node", "/app/ganache-core.docker.cli.js"]
CMD [""]
