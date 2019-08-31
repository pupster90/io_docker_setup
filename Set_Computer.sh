VERSION_NAME=v3.0.7

# Set io's Version name in custom.js file
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  ~/io_docker_setup/custom.js

####################
### Basic Setup ###
##################

### Setup Jupyter config file
echo "c.NotebookApp.ip = '0.0.0.0'" > ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_template_paths = ['/home/jovyan/.html_files','...html/templates','...html']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 80" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_origin = '*'" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.password = 'sha1:3efc472a30b9:6320e471692e9224957bd4ea358116df997980ed'" >> ~/.jupyter/jupyter_notebook_config.py 

### Generic Software Update
apt update
apt-get install update
conda update -y conda

# Install telnet for redis
#apt-get install -y telnet

### Install java
apt-get install -y openjdk-11-jdk
echo "JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'" >> ~/.bashrc 
JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'

###########################
# . Set Up R Packages . ###
###########################
conda install -y  -c conda-forge r-juniperkernel #install Juniper Kernel
sudo apt-get install -y libv8-dev
# These lines installs all the R packages added to io
R --slave --no-restore --no-save -e "install.packages('shinythemes', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('V8', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('shinyjs', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('plotly', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('BiocManager', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('devtools', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('ggthemes', repos = 'http://cran.us.r-project.org')"
R --slave --no-restore --no-save -e "install.packages('hash', repos = 'http://cran.us.r-project.org')"
# For installing devtools package
sudo apt-get update
apt-get install -y libhdf5-dev libcurl4-openssl-dev libssl-dev
# For installing Seurat: https://github.com/satijalab/seurat/issues/1183
echo "DEBIAN_FRONTEND=noninteractive" >> ~/.bashrc 
echo "DEBCONF_NONINTERACTIVE_SEEN=true" >> ~/.bashrc 
echo 'tzdata tzdata/Areas select US' | debconf-set-selections
echo 'tzdata tzdata/Zones/US select New York' | debconf-set-selections
apt-get install -y ca-certificates gnupg2
echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" | tee --append /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
apt-get update
# For installing SingleR
ln -s /bin/gzip /usr/bin/gzip
ln -s /bin/tar /bin/gtar
# Install Seurat
R --slave --no-restore --no-save -e "install.packages('Seurat', repos='https://cloud.r-project.org')"
# Install Singler
R --slave --no-restore --no-save -e "devtools::install_github('dviraran/SingleR')"

#################################
# .    Install Jupyter Stuff
#################################

### Install nb-extensiosn and GenePattern notebook
conda install -y -c damianavila82 rise
conda install -y -c conda-forge jupyter_contrib_nbextensions

### Setup nb-extensions
jupyter nbextensions_configurator enable
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
pip install --upgrade google-cloud-datastore
pip install --upgrade firebase-admin
pip install redis
pip install tensorflow==2.0.0-alpha0 
pip install keras																									

# Setup hidden files
mkdir ~/.js_files && mv ~/io_docker_setup/cytoscape.min.js ~/.js_files
mkdir ~/.html_files && mv ~/io_docker_setup/login.html ~/.html_files
mkdir ~/.jupyter/custom && mv ~/io_docker_setup/custom.js ~/.jupyter/custom 

# Setup Password
mv ~/io_docker_setup/Set_Password.py ~/.Set_Password.py
chmod +x ~/io_docker_setup/password ~/io_docker_setup/Password
mv ~/io_docker_setup/password /usr/local/bin
mv ~/io_docker_setup/Password /usr/local/bin

# Load in welcome_to_io
#cd ~ && git clone https://github.com/pupster90/Welcome_to_io.git






##########################
### Install Languages ###
########################

### Install Java using IJava kernel
cd ~ && curl -L https://github.com/SpencerPark/IJava/releases/download/v1.2.0/ijava-1.2.0.zip > ijava-kernel.zip
cd ~ && unzip ijava-kernel.zip -d ijava-kernel 
cd ~/ijava-kernel && python3 install.py --sys-prefix

# ### Install  scijava: Groovy, Python, BeanShell, Clojure, JavaScript, Scala
# conda install -y scijava-jupyter-kernel

### Install C++ using the Zeus kernel
conda install -y xeus-cling notebook -c QuantStack -c conda-forge

### Install node.js
#apt-get update
#apt update
apt-get install -y nodejs
#apt-get install -y npm # <-- Package didn't install correctly
apt-get install -y libzmq3-dev
apt-get install -y pkg-config
# Command didn't work: ln -s "$(which nodejs)" /usr/bin/node  #<-- this creates a symlink
pip install msgpack
pip install pixiedust
pip install pixiedust_node

### Python 2.7
# useful link: https://stackoverflow.com/questions/18363022/importerror-no-module-named-pip
apt-get install -y python-pip
# useful link: https://ipython.readthedocs.io/en/latest/install/kernel_install.html
python2 -m pip install ipykernel
python2 -m ipykernel install --user
python2 -m pip install pandas
python2 -m pip install scipy
python2 -m pip install matplotlib



############################
### Add Folders & Files ###
##########################

# Create user's starting Apps & Files by downloading everything from github
cd ~ && mkdir Apps Downloads Private Public       #<-- Create folders
cd ~/Apps && git clone https://github.com/pupster90/Cytoscape.git
cd ~/Apps && git clone https://github.com/pupster90/io_View.git
cd ~/Apps && git clone https://github.com/pupster90/io_Online.git
cd ~/Apps && git clone https://github.com/pupster90/io_Blog.git
cd ~/Public && git clone https://github.com/pupster90/Public_Profile.git
cd ~/Public && git clone https://github.com/pupster90/My_First_Research_Paper.git
cd ~/Public && git clone https://github.com/pupster90/io_Presentation.git



#################
### Clean up ###
###############
rm -rf ~/work ~/ijava-kernel ~/ijava-kernel.zip ~/io_docker_setup




