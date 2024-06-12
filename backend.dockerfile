FROM node:buster-slim

# Install yarn
RUN apt-get update && apt-get install -y yarn

ARG SEARXNG_API_URL
WORKDIR /app
COPY src /app/src
COPY tsconfig.json /app/
COPY config.toml /app/
COPY package.json /app/
COPY yarn.lock /app/
RUN sed -i "s|SEARXNG = \".*\"|SEARXNG = \"${SEARXNG_API_URL}\"|g" /app/config.toml
RUN yarn install
RUN yarn build
CMD ["yarn", "start"]
