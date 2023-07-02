# build image dari Dockerfile
docker build -t item-app:v1 .

# mengubah tag image agar sesuai dengan github packages
docker tag item-app:v1 ghcr.io/hradkafeira/item-app:v1

# melihat daftar image di docker lokal
docker images

# login github packages dengan menggunakan environment variabel
echo $PAT | docker login ghcr.io -u hradkafeira --password-stdin

# mengupload image ke github packages
docker push ghcr.io/hradkafeira/item-app:v1
