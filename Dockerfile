# NB: ensure the version matches that in buildpack.yml
FROM nginx:mainline

LABEL Author="Europeana Foundation <development@europeana.eu>"

# TODO: add a self-signed SSL certificate

COPY docker/env-nginx docker/rewrite-nginx-conf /usr/sbin/

COPY public /usr/share/nginx/html
COPY mime.types /etc/nginx/
COPY nginx.conf.d/ /etc/nginx/nginx.conf.d/

COPY nginx_orig.conf /etc/nginx/nginx.template.conf

RUN rewrite-nginx-conf

ENTRYPOINT ["env-nginx"]
