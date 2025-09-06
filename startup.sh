#!/bin/bash
set -e

python manage.py collectstatic --noinput

exec gunicorn --workers 3 --bind 0.0.0.0:$PORT fyp.wsgi:application
