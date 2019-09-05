FROM alpine:latest

# see: https://storage.googleapis.com/kubernetes-release/release/stable.txt
ENV KUBECTL_STABLE_VERSION="v1.15.3"

RUN apk add --update ca-certificates && \
    apk add --update -t deps curl && \
    apk add --update gettext && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_STABLE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk del --purge deps && \
    rm /var/cache/apk/*
