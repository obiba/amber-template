# Amber Template

Amber server with client apps, as Docker images to build.

## Amber Applications

### Amber Server API Dockerfile

Amber server is a [nodejs](https://nodejs.org/) application. Most of the runtime parameters can be set using [environment variables]((https://github.com/obiba/amber/blob/main/README.md#environment-variables)). For advanced usage, the runtime settings **can** also be amended by copying a local [./config/production.json](https://github.com/obiba/amber/blob/main/config/production.json) file.

### Amber Studio app Dockerfile

Amber Studio is a [Quasar SPA](https://quasar.dev/quasar-cli-vite/developing-spa/introduction) (single page application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-studio/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-studio/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-studio/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

### Amber Collect app Dockerfile

Amber Collect is a [Quasar PWA](https://quasar.dev/quasar-cli-vite/developing-pwa/introduction) (progressive web application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-collect/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-collect/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-collect/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

### Amber Visit app Dockerfile

Amber Collect is a [Quasar SPA](https://quasar.dev/quasar-cli-vite/developing-spa/introduction) (single page application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-visit/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-visitt/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-visit/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

### Home Page

This home page could be any static website of your own, that will be the landing page for redirecting the user to each of the Amber applications.

## Amber Docker Compose

The production Docker files described above can be wrapped up by [Docker Compose](https://docs.docker.com/compose/).

The following is an example of a production set up that extends the proposed template:

```
.
├── amber
│   ├── config
│   │   ├── email_templates
|   |   |   └── ...
│   │   └── production.json
│   └── Dockerfile
├── amber-collect
│   ├── Dockerfile
│   ├── public
│   │   ├── favicon.ico
│   │   └── icons
│   │       ├── android-icon-144x144.png
│   │       └── ...
│   ├── src
│   │   └── css
│   │       └── custom.scss
│   └── settings.json
├── amber-visit
│   ├── Dockerfile
│   ├── public
│   │   ├── favicon.ico
│   │   └── icons
│   │       ├── android-icon-144x144.png
│   │       └── ...
│   ├── src
│   │   └── css
│   │       └── custom.scss
│   └── settings.json
├── amber-studio
│   ├── Dockerfile
│   ├── public
│   │   ├── favicon.ico
│   │   └── icons
│   │       ├── android-icon-144x144.png
│   │       └── ...
│   ├── src
│   │   └── css
│   │       └── custom.scss
│   └── settings.json
├── home
│   └── index.html
├── .env
└── docker-compose.yml
```

The `docker-compose.yml` file for a production Amber runtime will then look like (environment variables are defined in the `.env` file, see [amber's environment variables](https://github.com/obiba/amber/blob/main/README.md#environment-variables) description).

Note that in this example the MongoDB server is provided by a Docker image ([mongo](https://hub.docker.com/_/mongo/)), but it could also be externalized.

Note also the usage of the [Traefik](https://traefik.io/traefik/) reverse proxy that allows to set up the URLs on the same base like:

* Home page: https://amber.example.org
* Amber Server API: https://amber.example.org/api
* Amber Studio: https://amber.example.org/studio
* Amber Collect: https://amber.example.org/collect
* Amber Visit: https://amber.example.org/visit

To build the production Docker images, use the command:

```
make build
```

Then start the Amber server and apps with:

```
make up
```
