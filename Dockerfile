FROM python:rc-slim-buster

RUN apt-get update

RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/pip_cache
RUN mkdir -p /opt/app/django
COPY requirements.txt run-server.sh application.properties /opt/app/
RUN chmod 755 /opt/app/run-server.sh
ADD django_project /opt/app/django_project
WORKDIR /opt/app
RUN pip install -r requirements.txt --cache-dir /opt/app/pip_cache
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8000
STOPSIGNAL SIGTERM
CMD ["/opt/app/run-server.sh"]