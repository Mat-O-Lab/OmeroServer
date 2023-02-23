#!/bin/bash
# Override omero.web.server_list with OMEROHOST if set

set -eu

omero=/opt/omero/web/venv3/bin/omero

OMEROHOST=${OMEROHOST:-}
if [ "$CONFIG_omero_web_public_enable" = "True" ]; then
    #$omero config set omero.web.server_list "[[\"$OMEROHOST\", 4064, \"omero\"]]"
    echo "adding public user"
    $omero login -s $OMEROHOST -p 4064 -u root -w $ROOTPASS || true
    $omero group add public --perms='rwr---' || true
    $omero user add $CONFIG_omero_web_public_user Public User --group-name public -P $CONFIG_omero_web_public_password || true
    echo "successfully added public user"
fi