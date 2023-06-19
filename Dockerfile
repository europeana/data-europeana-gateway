FROM nginx:1.23

LABEL Author="Europeana Foundation <development@europeana.eu>"

COPY env-nginx  /usr/sbin/

COPY public /usr/share/nginx/html
COPY mime.types /etc/nginx/
COPY nginx.conf.d/ /etc/nginx/nginx.conf.d/

COPY nginx.conf.template /etc/nginx/nginx.conf.template

ENTRYPOINT ["env-nginx"]
