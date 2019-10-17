#  Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


# /app/build is where prod assets to serve to outside world will be

# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#default command of nginx is to run, no 'RUN' command needed