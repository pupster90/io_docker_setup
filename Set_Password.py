#####################
### Set Password ###
###################

# This file is used to set the passphrase for the jupyter website when it is launched

#You can run this function from the terminal with:  python Set_Password.py "password"

from notebook.auth import passwd
import os
import sys

if __name__ == "__main__":
    password = sys.argv[1]
    password_hash = passwd( password )
    os.system(f"""echo "c.NotebookApp.password = u'{password_hash}'" >> ~/.jupyter/jupyter_notebook_config.py""")

# Note: The command `subprocess` is supposed to be better but I cant get it to work:
###   import subprocess
###   subprocess.call(["echo",f""" "c.NotebookApp.password = u'{password_hash}'" """,">>","~/.jupyter/jupyter_notebook_config.py"]) 















