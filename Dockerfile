# Imagen base ligera
FROM node:18-alpine

# Directorio de trabajo
WORKDIR /app

# Copiar archivos y dependencias
COPY package.json package-lock.json ./
RUN npm install --production

# Copiar código fuente
COPY . .

# Exponer puerto de la aplicación
EXPOSE 3000
# Comando de inicio
CMD ["node", "app.js"]
