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

## Setup custom.js file
create a new file called `custom.js` at `home/jovyan/.jupyter/custom/custom.js` and add the following lines to it
```javascript
// Load in Cytcoscape: There should be a better way to do this!
requirejs.config({ paths: {
  cytoscape: 'cytoscape.min'
} });

// Change Text Editor View 
if( document.getElementById("texteditor-container") != null ){
document.getElementById("texteditor-container").className = "container-fluid"
document.getElementById("menubar-container").className = "container-fluid"
document.getElementById("header-container").className = "container-fluid"
document.getElementById("texteditor-backdrop").style.padding = "0px"
}
// Change Terminal View 
if( document.getElementById("terminado-container") != null ){
document.getElementById("terminado-container").className = "container-fluid"
document.getElementById("header-container").className = "container-fluid"
document.getElementsByClassName("terminado-container-container")[0].style.padding = "0px"
}
// Make Scrolling Work on Ipad 
var style = document.createElement("style"); 
style.innerHTML = "body {-webkit-overflow-scrolling: touch;}"
document.getElementsByTagName("body")[0].appendChild(style)
```
## Setup Jupyter's Configuration File
Add the following line to jupyter's config file, located at `/home/jovyan/.jupyter/jupyter_notebook_config.py` 
<small>There should be a better way to do this without downloading cytoscapes js into docker!</small> 
c.NotebookApp.extra_static_paths = ["/home/jovyan/.js_files"]
