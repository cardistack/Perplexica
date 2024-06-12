FROM node:alpine

ARG NEXT_PUBLIC_WS_URL
ARG NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_WS_URL=${NEXT_PUBLIC_WS_URL}
ENV NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL}

# Install yarn
RUN apk add --no-cache yarn

WORKDIR /app
COPY ui /app/
RUN yarn install
RUN yarn build
CMD ["yarn", "start"]
