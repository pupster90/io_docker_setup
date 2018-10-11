
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
mkdir ~/.js_files && cd ~/.js_files && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/v1.0.0/cytoscape.min.js
mkdir ~/.jupyter/custom && cd ~/.jupyter/custom && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/v1.0.0/custom.js

# Setup Jupyter config file
#cd ~/.jupyter && openssl req -x509 -batch  -nodes -days 999 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
#echo "c.NotebookApp.certfile = u'/home/jovyan/.jupyter/mycert.pem'" >> ~/.jupyter/jupyter_notebook_config.py
#echo "c.NotebookApp.keyfile =  u'/home/jovyan/.jupyter/mykey.key'"  >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'" > ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 80" >> ~/.jupyter/jupyter_notebook_config.py  
# *NOTE: Delete line below in later versions
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  

# Load in welcome_to_io
cd ~ && git clone https://github.com/pupster90/Welcome_to_io.git

# Clean up
rm -rf ~/work ~/1_0_0.sh

# Function called when Docker is built:
#cd ~/ && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/v1.0.0/Password && chmod +x Password
#cd ~/ && curl -O https://raw.githubusercontent.com/pupster90/io_docker_setup/master/v1.0.0/Set_Password.py
#Password () {
#   cd ~/ && python Set_Password.py "$1"
#   rm -rf Set_Password.py
#   start-notebook.sh
#}




