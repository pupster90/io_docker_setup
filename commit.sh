# This file commits a docker container running io into a form for publishing
docker commit --change='CMD ["tini", "-g", "jupyter", "notebook"]' -c "EXPOSE 80" io-new  gcr.io/pupster900/io:v3.0.3
