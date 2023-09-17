# build stage
FROM obiba/amber-visit:latest as build-stage
ARG AMBER_URL
ARG RECAPTCHA_SITE_KEY
WORKDIR /app
# copy local files into the source folder
COPY . .
RUN yarn
RUN yarn quasar build --mode pwa

# production stage
FROM nginx:alpine as production-stage
COPY --from=build-stage /app/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/pwa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
