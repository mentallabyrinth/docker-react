# Begin first phase
FROM node:alpine as builder

WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


# Begin second phase
FROM nginx:stable-alpine 
COPY --from=builder /usr/app/build /usr/share/nginx/html