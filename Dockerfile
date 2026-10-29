
ARG CADDY_VERSION=2.11.7

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

ARG CADDY_VERSION
ARG BOUNCER_VERSION=latest

RUN xcaddy build v${CADDY_VERSION} \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http=github.com/hslatman/caddy-crowdsec-bouncer@${BOUNCER_VERSION}
FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
