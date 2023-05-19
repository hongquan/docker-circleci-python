FROM alpine:3.14
# For Python 3.9 and Node 16

ENV LANG en_US.UTF-8

RUN apk --update add bash python3 py3-pip nodejs-current yarn build-base tzdata rsync fd && \
    apk add sshpass openssh-client openssl ca-certificates git && \
    apk add libffi-dev python3-dev jpeg-dev yaml-dev zlib-dev postgresql-dev libxml2-dev libxslt-dev gdk-pixbuf-dev cairo-dev && \
    pip3 install -U pip wheel && \
    pip3 install --ignore-installed poetry && \
    yarn global add npx && \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
