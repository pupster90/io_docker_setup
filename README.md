# Docker Setup for IO
This file explains hows I setup the docker file for IO. *Please Note* this is meant to be used as a reference for later adaptations, just running lines line by line won't work.

# 1: Get Base Docker
I build my docker image off of whatever is hte latest jupyter datascience docker: [jupyter/datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook/). I then access the docker interactively and setup my docker container. These are the steps to start running the interacitve docker container.

1. install docker
2. `docker pull jupyter/datascience-notebook`
3. `docker run -it -p 8888:8888 --name io jupyter/datascience-notebook /bin/bash`


# 2: Run Commands Inside Docker
After running the last line in the terminal u should now be inside the docker container. From here we get to work creating the image that we want.

## Install [NB-Extensions](https://github.com/ipython-contrib/jupyter_contrib_nbextensions)
We install nbextensions. Then we run jupyter on the docker so that we can customize which nb_extensions we want to use. Note, to access the docker got to ur computer's port 8888, and then type the token that is displayed from `jupyter notebook`
1. `conda install -c  conda-forge jupyter_contrib_nbextensions`
2. `cd && jupyter notebook`
3. Exit docker with `ctrl-c`

## Install Packages
Here we install python packages that are used in io
1. `pip install ndex2-dev`
2. `pip install PyGithub`

## Setup Files

