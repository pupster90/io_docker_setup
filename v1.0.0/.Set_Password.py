from notebook.auth import passwd
import os
import sys

def Set_Password( password ):
    password_hash = passwd( password )
    os.system(f"""echo "c.NotebookApp.password = u'{password_hash}'" >> ~/.jupyter/jupyter_notebook_config.py""")

if __name__ == "__main__":
    password = sys.argv[1]
    Set_Password( password )

