FROM httpd:2-alpine
WORKDIR /app
RUN apk update
RUN apk add --update nodejs npm
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . .
RUN npm run build
RUN cp -a ./public/. /usr/local/apache2/htdocs/
EXPOSE 80