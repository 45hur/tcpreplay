docker stop tcpr
docker rm tcpr
docker build . -t tcpr
docker run --cap-add=NET_RAW --cap-add=NET_ADMIN --name=tcpr tcpr