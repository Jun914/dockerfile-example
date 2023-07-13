FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get install -y nginx
RUN apt-get install -y git

RUN git clone https://github.com/Jun914/web-resource.git
COPY sites-available/default /etc/nginx/sites-available/default
RUN cp -r web-resource/* /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80

