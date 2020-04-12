FROM ubuntu:18.04

RUN apt-get clean && apt-get update
RUN apt-get install curl --yes
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs --yes

WORKDIR /opt/app

COPY . .

RUN npm install --production

EXPOSE 8888

STOPSIGNAL SIGUSR1

CMD ["node", "index.js"]

