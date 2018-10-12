### NOT FINISHED! ###

FROM jupyter/datascience-notebook:1145fb1198b2
USER root
WORKDIR /home/jovyan

RUN curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/v1.0.0/1_0_0.sh
RUN chmod +x 1_0_0.sh && ./1_0_0.sh

EXPOSE 80
CMD ["jupyter","notebook"]





