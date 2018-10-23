FROM node:9.11.1-wheezy

RUN npm i pm2 -g

COPY package.json package.json
RUN npm i -d --unsafe-perm || ((if [ -f npm-debug.log ]; then cat npm-debug.log; fi) && false)

COPY . .

CMD ["pm2-docker", "process.yml"]
