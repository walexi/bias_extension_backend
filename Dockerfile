FROM node:12.18.4

LABEL MAINTAINER Olawale Onabola <walexi4great@gmail.com>

RUN npm install pm2@latest --global --quiet
# add local user for security
RUN groupadd -r nodejs \
  && useradd -m -r -g nodejs nodejs

USER nodejs

# copy local files into container, set working directory and user
RUN mkdir -p /home/nodejs/app
WORKDIR /home/nodejs/app
COPY . /home/nodejs/app

RUN npm install --production --quiet


CMD ["pm2-runtime", "./config/pm2.json"]
