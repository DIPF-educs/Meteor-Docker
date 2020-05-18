FROM debian:10-slim

RUN set -x \
 && apt-get update -qq > /dev/null \
 && apt-get install -y -qq curl > /dev/null \
 && curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh \
 && useradd -m -G users -s /bin/bash meteor \
 && rm -rf /var/lib/apt/lists/*

USER meteor

ENTRYPOINT ["/bin/bash"]
