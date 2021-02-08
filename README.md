# word_counter
Simple application to present basic concepts of CI/CD, orchestratrion, service discovery and load balancing.

## Technologies
- Python 3 with Flask
- HashiCorp Nomad as the Orchestrator
- HashiCorp Consul as the Service Discovery
- Fabio LB as the Load Balancer
- Github as Docker image repository
- Docker
- Virtualenv
- Basic HTML

## How to run the application
0. Install Docker on your server
1. Download Nomad https://www.nomadproject.io/downloads
2. Unzip the package and move the single binary to /usr/local/bin/nomad
3. Open a terminal and type: `nomad agent -dev`. One important note — in dev mode,
Nomad will not persist any data. That’s fine for experimenting and prototyping, 
but not something you should do in production.
4. Open Nomad dashboard accessing `http://localhost:4646`
5. At Jobs section, click "Run Job" and paste the content of the file `infra/consul.nomad`
6. At Jobs section, click "Run Job" and paste the content of the file `infra/fabio.nomad`
7. At Jobs section, click "Run Job" and paste the content of the file `infra/word_counter.nomad`
8. Access `http://localhost:9999` to access the word counter serice UI

## How to monitor 
Access `http://localhost:4646` to monitor the jobs being orchestrated
Access `http://localhost:8500` to monitor the services being discovered
Access `http://127.0.0.1:9998` to monitor the services being balanced

## How to scaling up
1. Click on `j-word-counter` job and hit `Stop`
2. Access the file `infra/word_counter.nomad` and change `scaling min max` as needed
3. At Jobs section, click "Run Job" and paste the content of the file `infra/word_counter.nomad`

## Considerations
- Some configurations are set to consider a debug or dev environment. At a production environment,
some changes would be required.
- About CI/CD, the most important file is `word_counter.yml`, that is an `Github Action` and the `Dockerfile`.
- CI/CD and Github Actions is not the focus of this README.md, but were all implemented in the repository.
- Github as image repository requires some specific configurations that was not covered in this README.md