FROM node:8

RUN set -x \
 && curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh \
 && useradd -m -G users -s /bin/bash meteor

USER meteor
