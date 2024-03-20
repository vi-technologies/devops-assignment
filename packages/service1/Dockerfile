FROM node:lts-alpine3.19 as build
WORKDIR /src
COPY . /src
RUN npm install
RUN rm package*

FROM node:lts-alpine3.19
RUN mkdir /app
WORKDIR /app
ENV MONGODB_URL=""
EXPOSE 3000
COPY --from=build /src/ /app 
CMD ["node", "index.js"]