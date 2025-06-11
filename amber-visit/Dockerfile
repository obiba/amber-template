# build stage
FROM obiba/amber-visit:latest AS build-stage
ARG AMBER_URL
ARG RECAPTCHA_SITE_KEY
ARG PATH_PREFIX
WORKDIR /app
# copy local files into the source folder
COPY . .
RUN yarn && yarn quasar build

# production stage
FROM nginx:alpine AS production-stage
COPY --from=build-stage /app/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
