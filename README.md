# OMERO.server and OMERO.web (docker-compose)

This is an example of running OMERO.server and OMERO.web in Docker.

OMERO.server is listening on APP_API_PORT
OMERO.web is listening on APP_PORT

Log in as user `root` password WEB_ROOT_PASS.

# create a .env file with
```bash
APP_PORT=<web_app_port>
APP_API_PORT=<api_app_port>
APP_API_SSL_PORT=<api_ssl_app_port>
WEBSOCK_PORT=<websocket_port>
WEBSOCK_SSL_PORT=<websocket_ssl_port>

OMERO_DB_USER=<db_user_name>
OMERO_DB_PASS=<db_user_passw>
OMERO_DB_NAME=<omero_database>
OMERO_ROOT_PASS=<omero_root_password>
OMERO_DATA_DIR="/OMERO"
OMERO_DB_HOST=database
OMERO_DB_PORT=5432
OMERO_WEB_ALLOWED_HOST='["omeroweb","localhost"]'
OMERO_WEB_DEBUG=False
OMERO_WEB_SECURE__PROXY__SSL__HEADER='["HTTP_X_FORWARDED_PROTO", "https"]'
OMERO_WEB_ABSOLUT_URL='https://omero.example.com/'
OMERO_WEB_PUBLIC_ENABLE=True
OMERO_WEB_PUBLIC_USER='public-user'
OMERO_WEB_PUBLIC_PASSWORD=<public-user-password>
```


## Run

First pull the latest major versions of the containers:

    docker-compose pull

Then start the containers:

    docker-compose up -d
    docker-compose logs -f

For more configuration options see:
- https://github.com/ome/omero-server-docToker/blob/master/README.md
- https://github.com/ome/omero-web-docker/blob/master/README.md

## Configure Proxy
The setup is supposed to sit behind a nginx reverse proxy.
Passing request as http to the services.
An easy deployment can be achieved by using nginx proxymanger which provides also certificates through letscrypt.

We suggest two proxy hosts for server and web seperatly.

## Omero Server Proxy host
Create a proxyhost with websocket support and just proxy_pass to the host running the doccker-compose stack with http and the websocket port.
Should be working with all the options applicable by the ssl config tab.

## Omero Web Proxy host
Create a proxyhost poiting by http to the machine hosting the stack and the omero_web_port.
Should be working with all the options applicable by the ssl config tab.

To make the web app api login useable u have to add this to the root or api location

location /api
```nginx
proxy_set_header X-Forwarded-Proto $scheme;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
```
