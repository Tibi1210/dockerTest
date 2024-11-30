# DevOps Projekt munka

## Kiírás:

Projektmunka: 1 projekt teljeskörű CI/CD implementációja.
  - Code (10 pont)
  - Build & Test (15 pont)
  - Release & Deploy (15 pont)
  - Monitor & Feedback (10 pont)
  - Tool-ok: legalább 5 használata (Git, Docker nem számít)
  - Readme a projekthez (működésről)

## Előfeltételek:

### Jenkins: 
- Jenkins image: ```docker build -t my-jenkins -f Dockerfile_jenkins .```
- Jenkins container: ```docker run -it --rm -p 8080:8080 -p 50000:50000 -v ./jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock my-jenkins```

### Registry az imageknek
- Registry: ```docker run -it -p 5000:5000 registry:2```

### App build
- Image: ```docker build -t nodejs-sample-app -f Dockerfile_node .```
- Tag: ```docker tag nodejs-sample-app:latest localhost:5000/nodejs-sample-app:latest```
- Push image to registry: ```docker push localhost:5000/nodejs-sample-app:latest```

### Prometheus build
- Prometheus image: ```docker build -t prometheus -f Dockerfile_prometheus .```
- Tag: ```docker tag prometheus:latest localhost:5000/prometheus:latest```
- Push image to registry: ```docker push localhost:5000/prometheus:latest```

_A terraformmal való buildelés hibára vezetett context: "." és context: "full path"-al is, de a terraform fileban ottvan hogy kellene... <strong>Error msg: failed to read downloaded context: failed to load cache key: invalid response status 403</strong>_

### Pipeline
- Pipeline script from SCM: 
    - url: https://github.com/Tibi1210/dockerTest.git
    - branch: */main

