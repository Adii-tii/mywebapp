FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

EXPOSE PORT 80