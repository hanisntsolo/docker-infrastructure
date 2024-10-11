# Docker Infrastructure
A project to manage and deploy a variety of services using Docker Compose. This repository simplifies the orchestration and management of different services through Docker containers.

To push the changes use : 
git push  https://$GITHUB_TOKEN@github.com/hanisntsolo/docker-infrastructure.git

While contributing to this repo:
have a new infrastructure which is previous not present in here.

add it using docker-compose.yml 

raise a pull request.



## Features

- **Multi-service Setup**: Supports running multiple containers simultaneously for different services.
- **Easy Configuration**: Configure services using YAML files for easy deployment.
- **Automated Infrastructure**: Uses Docker Compose to handle containerized service lifecycles.
  
## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. **Clone the repository**:
    ```bash
    git clone https://github.com/hanisntsolo/docker-infrastructure.git
    cd docker-infrastructure
    ```

2. **Start services**:
    ```bash
    docker-compose up -d
    ```

3. **Check the status** of services:
    ```bash
    docker-compose ps
    ```

4. **Stop services**:
    ```bash
    docker-compose down
    ```

## Directory Structure

- **docker-compose.yml**: Main configuration file for orchestrating containers.
- **services/**: Contains individual service configurations.
  
## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/hanisntsolo/docker-infrastructure/blob/main/LICENSE) file for details.


