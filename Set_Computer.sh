


####################
### Basic Setup ###
##################

# Install nb-extensiosn
conda install -y -c damianavila82 rise
conda install -y -c conda-forge jupyter_contrib_nbextensions

# Setup nb-extensions
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable help_panel/help_panel
jupyter nbextension enable notify/notify
jupyter nbextension enable toc2/main
jupyter nbextension enable varInspector/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable hide_header/main
jupyter nbextension enable hide_input_all/main
jupyter nbextension enable table_beautifier/main
jupyter nbextension enable codefolding/edit
jupyter nbextension enable contrib_nbextensions_help_item/main
jupyter nbextension enable python-markdown/main
jupyter nbextension enable move_selected_cells/main
jupyter nbextension enable splitcell/splitcell
jupyter nbextension enable tree-filter/index

# install python packages
pip install ndex2-performance
pip install PyGithub
pip install timeago

# Setup hidden files
mkdir ~/.js_files && cd ~/.js_files && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/cytoscape.min.js
mkdir ~/.jupyter/custom && cd ~/.jupyter/custom && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/custom.js

# Setup Jupyter config file
echo "c.NotebookApp.ip = '0.0.0.0'" > ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 80" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  

# Setup Password
cd ~ && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/Set_Password.py .Set_Password.py
cd /usr/local/bin && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/Password && chmod +x Password
cd /usr/local/bin && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/password && chmod +x password

# Load in welcome_to_io
cd ~ && git clone https://github.com/pupster90/Welcome_to_io.git



##########################
### Install Languages ###
########################

# DO THIS


#################
### Clean up ###
###############
rm -rf ~/work ~/Set_Computer.sh




