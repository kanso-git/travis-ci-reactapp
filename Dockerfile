FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM httpd:2.4
EXPOSE 80
COPY --from=0 /app/build /usr/local/apache2/htdocs/