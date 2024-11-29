# DevOps Projekt munka

## Előfeltételek:

## Jenkins: 
- Jenkins image: ```docker build -t my-jenkins -f Dockerfile_jenkins .```
- Jenkins container: ```docker run -it --rm -p 8080:8080 -p 50000:50000 -v ./jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock my-jenkins```


## App build
- App image: ```docker build -t nodejs-sample-app -f Dockerfile .```
- Tag image: ```docker tag nodejs-sample-app:latest localhost:5000/nodejs-sample-app:latest```
- Registry: ```docker run -it -p 5000:5000 registry:2```
- Push image to registry: ```docker push localhost:5000/nodejs-sample-app:latest```
