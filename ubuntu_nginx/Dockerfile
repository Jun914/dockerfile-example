FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y nginx git
RUN git clone https://github.com/Jun914/web-resource.git
COPY nginx/sites-available/default /etc/nginx/sites-available/default
RUN cp -r web-resource/* /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80