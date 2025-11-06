FROM node:18-alpine
WORKDIR /opt
COPY . .
RUN npm install
CMD ["npm", "start"]
