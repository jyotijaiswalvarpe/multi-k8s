docker build -t jyotijaiswal88/multi-client:latest -t jyotijaiswal88/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jyotijaiswal88/multi-server:latest -t jyotijaiswal88/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jyotijaiswal88/multi-worker:latest -t jyotijaiswal88/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jyotijaiswal88/multi-client:latest
docker push jyotijaiswal88/multi-server:latest
docker push jyotijaiswal88/multi-worker:latest

docker push jyotijaiswal88/multi-client:$SHA
docker push jyotijaiswal88/multi-server:$SHA
docker push jyotijaiswal88/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jyotijaiswal88/multi-server:$SHA
kubectl set image deployments/client-deployment client=jyotijaiswal88/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jyotijaiswal88/multi-worker:$SHA

