FROM ubuntu:20.04

ARG OMERO_DB_PASS OMERO_DATA_DIR
RUN export PGPASSWORD="$OMERO_DB_PASS"
# Location of the OMERO.server
RUN export OMERODIR=/opt/omero/server/OMERO.server

# Location of the virtual environment for omero-py
RUN VENV_SERVER=/opt/omero/server/venv3

RUN export PATH=$VENV_SERVER/bin:$PATH


RUN useradd -ms /bin/bash omero-server
# Give a password to the omero user
# e.g. passwd omero-serve

RUN mkdir -p $OMERO_DATA_DIR
RUN chown omero-server $OMERO_DATA_DIR

USER omero-server
EXPOSE 4063 4064

COPY entrypoint.sh .
#ENTRYPOINT [".entrypoint.sh"]
ENTRYPOINT [ "/bin/bash" ]