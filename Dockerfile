FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install && npm install pm2 -g

COPY . .

RUN chown -R node:node /app
USER node

EXPOSE 3000

CMD ["pm2-runtime", "ecosystem.config.js"]
