FROM alpine:3.7 as stage

RUN apk add --no-cache \
    git \
    curl

RUN wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 && \
    chmod +x stern_linux_amd64 && \
    mv stern_linux_amd64 /usr/local/bin/stern && \
    curl https://get.okteto.com -sSfL | sh

FROM alpine:3.7 as app

COPY --from=stage ["/usr/local/bin/okteto", "/usr/local/bin/stern", "/usr/local/bin/"]

ENTRYPOINT ["/bin/sh"]