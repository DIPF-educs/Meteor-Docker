FROM debian:10-slim

ARG VERSION
RUN set -x \
 && apt-get update \
 && apt-get install -q -yy curl python3 sudo \
 && useradd -G users -m -s /bin/bash meteor \
 && echo "meteor ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/meteor \
 && chmod 0440 /etc/sudoers.d/meteor \
 && su - meteor -c "curl -sL https://install.meteor.com/?release=$VERSION | sed s/--progress-bar/-sL/g | /bin/bash" \
 && rm -rf /var/lib/apt/lists/*

USER meteor

ENTRYPOINT ["/bin/bash"]
