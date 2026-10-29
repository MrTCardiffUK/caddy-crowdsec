FROM caddy:2.11.7-builder-alpine AS builder

RUN xcaddy build v2.11.7 \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:2.11.7-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
