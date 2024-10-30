FROM node:20-alpine3.20

WORKDIR /usr/src/app

RUN apk add --no-cache git

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
