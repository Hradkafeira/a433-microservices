# menggunakan base image node versi 14
FROM node:14

# menentukan working direktori container di /app
WORKDIR /app

# menyalin seluruh code ke working directory di container
COPY . .

# menentukan environment untuk production
ENV NODE_ENV=production DB_HOST=item-db

# instalasi dependensi untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Expose port aplikasi di 8080
EXPOSE 8080

# menjalankan server node ketika container diluncurkan
CMD ["npm", "start"]
