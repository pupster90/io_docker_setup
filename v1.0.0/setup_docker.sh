
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
echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" > ~/.jupyter/jupyter_notebook_config.py
rm -rf work
rm -rf setup_docker.sh




