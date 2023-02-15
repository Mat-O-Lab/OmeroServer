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
WEBSOCK__SSL_PORT=<websocket_ssl_port>

OMERO_DB_USER=<db_user_name>
OMERO_DB_PASS=<db_user_passw>
OMERO_DB_NAME=<omero_database>
OMERO_ROOT_PASS=<omero_root_password>
OMERO_DATA_DIR="/OMERO"
OMERO_DB_HOST=database
OMERO_DB_PORT=5432
OMERO_WEB_ALLOWED_HOST="['localhost','omeroweb']"
```


## Run

First pull the latest major versions of the containers:

    docker-compose pull

Then start the containers:

    docker-compose up -d
    docker-compose logs -f

For more configuration options see:
- https://github.com/ome/omero-server-docker/blob/master/README.md
- https://github.com/ome/omero-web-docker/blob/master/README.md
