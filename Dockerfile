FROM node:12.14.0-alpine3.11

RUN mkdir -p /opt/app

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

ARG PORT=80
ENV PORT $PORT
EXPOSE $PORT

HEALTHCHECK CMD curl -fs http://localhost:$PORT/healthz || exit 1

WORKDIR /opt
COPY package.json package-lock.json* ./
RUN npm install && npm cache clean --force
ENV PATH /opt/node_modules/.bin:$PATH

WORKDIR /opt/app
COPY . /opt/app
RUN npm run build

CMD [ "npm", "start" ]