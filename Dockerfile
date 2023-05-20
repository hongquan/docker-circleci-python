FROM alpine:3.14
# For Python 3.9 and Node 16

ENV LANG en_US.UTF-8
ENV PATH "/root/.cargo/bin:${PATH}"

RUN apk --update add --no-cache bash python3 py3-pip nodejs-current yarn build-base rustup tzdata rsync fd && \
    apk add --no-cache sshpass openssh-client openssl ca-certificates git && \
    apk add --no-cache libffi-dev python3-dev jpeg-dev yaml-dev zlib-dev postgresql-dev libxml2-dev libxslt-dev && \
    apk add --no-cache gdk-pixbuf-dev cairo-dev pango-dev && \
    pip3 install -U pip wheel && \
    pip3 install --ignore-installed poetry && \
    yarn global add npx && \
    rustup-init -y --profile minimal && \
    rm -rf /root/.cache/pip && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
