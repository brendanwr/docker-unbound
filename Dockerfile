FROM alpine:3

RUN set -eux; \
	\
	apk --update --no-cache add \
	unbound \
	; \
	rm -rf /var/cache/apk/*

RUN wget -S \
    https://www.internic.net/domain/named.cache -O \
    /etc/unbound/root.hints

COPY unbound.conf /etc/unbound/unbound.conf

USER unbound

EXPOSE 5335/tcp
EXPOSE 5335/udp

CMD ["unbound", "-d"]
