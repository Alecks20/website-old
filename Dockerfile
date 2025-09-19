
FROM hugomods/hugo:latest AS build
WORKDIR /src
COPY . .
RUN hugo --minify

FROM nginx:1.27.0-alpine

RUN chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 755 /var/cache/nginx /var/run /var/log/nginx

COPY --from=build /src/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]