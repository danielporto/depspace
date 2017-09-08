FROM openjdk:8-jdk-alpine

# packages that must remain in the image
RUN apk add --no-cache --update bash
# packages that can be removed after deployment
RUN apk add --no-cache --update \
    --virtual .build-dependencies curl  apache-ant


COPY . /home/depspace
WORKDIR /home/depspace
RUN  ant
RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/bin/wait-for-it.sh && chmod +x /usr/bin/wait-for-it.sh
RUN apk del .build-dependencies  

#EXPOSE 11000
#CMD ["/bin/sh"] 
