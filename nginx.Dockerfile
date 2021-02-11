FROM nginx:latest


RUN apt-get update && apt-get install -y inotify-tools bash dumb-init

ENTRYPOINT ["dumb-init", "--"]

COPY nginx-reload.sh /app/nginx-reload.sh
RUN chmod +x /app/nginx-reload.sh

CMD ["/app/nginx-reload.sh"]