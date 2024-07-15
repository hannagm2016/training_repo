FROM nginx:latest
ARG CURRENT_ENVIRONMENT
ENV CURRENT_ENVIRONMENT=${CURRENT_ENVIRONMENT}
RUN rm /usr/share/nginx/html/index.html
COPY index.html.template /usr/share/nginx/html/index.html.template
RUN envsubst '${CURRENT_ENVIRONMENT}' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
