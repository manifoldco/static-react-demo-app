FROM nginx:stable

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx.conf /etc/nginx/conf.d/dashboard.conf.template
COPY ./build/ /var/www

# This is a hack around the envsubst nginx config. Because we have `$uri` set
# up, it would replace this as well. Now we just reset it to its original value.
ENV uri \$uri

# Default configuration
ENV PORT 80
ENV SERVER_NAME _

CMD ["sh", "-c", "envsubst < /etc/nginx/conf.d/dashboard.conf.template > /etc/nginx/conf.d/dashboard.conf && nginx -g 'daemon off;'"]
