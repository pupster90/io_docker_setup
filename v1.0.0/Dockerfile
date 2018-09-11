FROM jupyter/datascience-notebook:8ccdfc1da8d5
WORKDIR /home/jovyan

RUN curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/v1.0.0/setup_docker.sh
RUN chmod +x setup_docker.sh && ./setup_docker.sh

CMD jupyter notebook





