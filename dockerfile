# Utilise une image Nginx ultra-légère
FROM nginx:alpine

# Supprime la configuration par défaut inutile
RUN rm /etc/nginx/conf.d/default.conf

# Copie votre unique fichier HTML en le renommant en index.html
COPY index.html /usr/share/nginx/html/index.html

# Configure Nginx pour servir le fichier
RUN echo "server { listen 80; root /usr/share/nginx/html; \
      location / { try_files \$uri /index.html; }}" > /etc/nginx/conf.d/app.conf

# Port exposé (HTTP)
EXPOSE 80

# Lance Nginx
CMD ["nginx", "-g", "daemon off;"]