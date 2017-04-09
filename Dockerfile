FROM alpine:3.4

RUN apk --update add python py-setuptools py-pip git && \
    pip install \
        git+https://github.com/coreos/curator.git@fix-for-AWS-ES \
        requests-aws4auth && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/curator"]
