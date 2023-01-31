# build stage
FROM obiba/amber-studio:latest as build-stage
ARG AMBER_URL
ARG RECAPTCHA_SITE_KEY
WORKDIR /app
COPY . .
RUN yarn
RUN quasar build

# production stage
FROM nginx:alpine as production-stage
COPY --from=build-stage /app/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
