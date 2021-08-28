FROM node:15.6.0-alpine

ARG BUILD_ID
ENV BUILD_ID $BUILD_ID

WORKDIR /web

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn --frozen-lockfile --production

COPY . .

RUN yarn cache clean

ENTRYPOINT ["yarn"]
CMD ["start"]
