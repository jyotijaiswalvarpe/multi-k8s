docker build -t jyotijaiswal88/multi-client -f ./client/Dockerfile ./client
docker build -t jyotijaiswal88/multi-server -f ./client/Dockerfile ./server
docker build -t jyotijaiswal88/multi-worker -f ./client/Dockerfile ./worker
docker push jyotijaiswal88/multi-client
docker push jyotijaiswal88/multi-server
docker push jyotijaiswal88/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jyotijaiswal88/multi-server:$SHA
kubectl set image deployments/client-deployment client=jyotijaiswal88/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jyotijaiswal88/multi-worker:$SHA

