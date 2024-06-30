FROM node:20.9.0 AS build

WORKDIR /app

COPY package*.json ./

COPY . .

RUN yarn install --ignore-engines
RUN yarn build

FROM node:20.9.0 AS runtime

WORKDIR /app_build

COPY --from=build /app /app_build

RUN mv dist test_cicd

EXPOSE 3000

CMD ["node", "test_cicd/main"]