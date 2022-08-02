FROM node:18.7.0-alpine3.16 as truffle
LABEL org.opencontainers.image.source https://github.com/eth-eks/truffle
WORKDIR /contracts

RUN apk add --no-cache ca-certificates
RUN npm install -g ganache@7.4.0
RUN npm install -g truffle@5.5.23

ADD package.json package-lock.json ./
RUN npm i

#backward compatibility
RUN mkdir -p /app/; ln -s /usr/local/bin/ganache-cli /app/ganache-core.docker.cli.js 

EXPOSE 8545

ENTRYPOINT ["node","/app/ganache-core.docker.cli.js"]
CMD []
