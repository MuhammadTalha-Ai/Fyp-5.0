#!/bin/bash
set -e

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting gunicorn..."
exec gunicorn --bind=0.0.0.0:${PORT:-8000} fyp.wsgi:application --log-level debug
