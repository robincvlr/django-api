#!/usr/bin/env bash

######################################
# FUNCTIONS
######################################
exec_cmd() {
  echo "$@"
  eval "$@"
}

######################################
# CMD
######################################
exec_cmd "source application.properties"

exec_cmd "cd ${PROJECT_DIR}"

exec_cmd "pwd"

exec_cmd "ls -lrta"

exec_cmd "gunicorn --bind 0.0.0.0:8000 --chdir ./${APP_DIR} ${PROJECT_DIR}.wsgi --workers=${NUM_WORKERS}"
