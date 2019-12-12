FROM alpine:latest
RUN apk update && apk add openssh

COPY start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]


