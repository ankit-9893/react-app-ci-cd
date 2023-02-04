FROM node:14.20.1-alpine as builder
WORKDIR '/app'
# RUN pwd
COPY package.json .
RUN npm i
COPY . .
RUN npm run build
CMD ["npm", "run", "start"]


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# EXPOSE 4200:80
EXPOSE 80
