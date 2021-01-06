FROM python:rc-slim-buster

# install nginx
RUN apt-get update && apt-get install nginx vim -y --no-install-recommends
COPY nginx.default /etc/nginx/sites-available/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/pip_cache
RUN mkdir -p /opt/app/django
COPY requirements.txt run-server.sh /opt/app/
RUN chmod 755 /opt/app/run-server.sh
ADD django_project /opt/app/django_project
COPY nginx.default /opt/app/
WORKDIR /opt/app
RUN pip install -r requirements.txt --cache-dir /opt/app/pip_cache
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8000
STOPSIGNAL SIGTERM
CMD ["/opt/app/run-server.sh"]