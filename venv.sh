#!/usr/bin/env bash
# call this with `source`

# bootstrap
cur=$(pwd);
if [ ! -d "venv" ]; then
  virtualenv venv
fi
venv=$cur/venv/bin
source $venv/activate  # opp. $ deactivate

# python now is venv's python

# functions
function freeze_requirement() {
    pip freeze > requirements.txt
}

function django_admin() {
    # ... startproject myapp
    python $venv/django-admin.py "$@"
}

function local_server() {
    python manage.py runserver 0.0.0.0:8000
}

function db() {
    #  python manage.py --help
    if [ $1 = 'init' ]; then
        python manage.py syncdb
    elif [ $1 = 'migrate' ]; then
        python manage.py migrate
    elif [ $1 = 'makemigraitons' ]; then
        python manage.py makemigraitons
    else
        echo "Command not found"
    fi
}
