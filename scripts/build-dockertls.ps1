cd C:\Users\stefan\code\insider\dockertls

Write-Host Building dockertls image
docker build -t dockertls .

docker images

# Write-Host Testing dockertls image
# docker run --rm -e SERVER_NAME=test -e IP_ADDRESSES=127.0.0.1 dockertls

docker tag dockertls stefanscherer/dockertls-windows:insider
