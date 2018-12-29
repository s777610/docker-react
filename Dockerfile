# This is for production model

# first temporary container
# start installing packages and building files
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# all file are under /app/build folder

# second container
# start building prod server, and copy files into new container
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html