docker stop relay starter redis_service
docker rm $(docker ps -a -q)
docker rmi upitzer42/gloop-relay
docker rmi upitzer42/gloop-relay
docker rmi upitzer42/gloop-match-starter

docker run -d -p 6379:6379 --name=redis_service redis:5.0.6-alpine 
docker run -d -p 8080:8080 -e REDIS_ADDRESS=redis://172.17.0.2:6379 --name=relay upitzer42/gloop-relay
docker run -d --name=starter -e REDIS_ADDRESS=redis://172.17.0.2:6379 upitzer42/gloop-match-starter