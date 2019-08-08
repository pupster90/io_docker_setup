# This file commits a docker container running io into a form for publishing
docker commit --change='CMD ["tini", "-g", "jupyter", "notebook"]' -c "EXPOSE 80" -c "EXPOSE 8888" io-test  pupster90/io:v3.0.7
