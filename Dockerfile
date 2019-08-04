# Create Node.js Container
FROM node:alpine as builder

WORKDIR /src/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Dump old container and start new 
FROM nginx

COPY --from=builder /src/app/build /usr/share/nginx/html
# after that [run docker build .]
