# DevOps Projekt munka

## Kiírás:

Projektmunka: 1 projekt teljeskörű CI/CD implementációja.
  - Code (10 pont)
  - Build & Test (15 pont)
    - Jenkins pipeline lint és teszt esetek futtatása
    - Terraform hiba miatt manuális buildelés + docker registry (de a terraform kód megvan ha működne automatán...)
  - Release & Deploy (15 pont)
    - Jenkins + Terraform docker, Jenkinsben pipeline a terraform műveletekhez (init, plan, apply, destroy)
  - Monitor & Feedback (10 pont)
    - Prometheus adatgyűjtés
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

### Pipelineok
- Script from SCM: 
    - url: https://github.com/Tibi1210/dockerTest.git
    - branch: */main
    - fileok: 
      - Jenkinsfile_deploy
      - Jenkinsfile_network
      - Jenkinsfile_stop

## Működés:
- A NodeTest pipeline figyeli a projekt repositoryt változásokért és amint egy commit érkezik lefuttatja a lint és teszt fázisokat
- Ha a buildelés és tesztelés sikeresen megtörtént a ReleaseDeploy pipeline automatikusan indul, a környezet felépül, az alkalmazás elindul, valamint a monitorozás is kezdetét veszi
- Elérhetőségek: 
  - Node alkalmazás: "localhost:300[0-4]" címek
  - Prometheus: "localhost:9090"
  - Grafana: "localhost:4000"
  - Graylog: "localhost:9000"

