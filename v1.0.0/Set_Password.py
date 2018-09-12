
# coding: utf-8

# <font size=8 face="courier" color="magenta">Set Password</font>

# This file creates the `.py` file that is used to set the passphrase for the jupyter server when it is launched

# In[22]:


from notebook.auth import passwd
import os
import sys


# <font color="blue">Set_Password</font> creates the password that is used for jupyter and set's it in jupyer's config file

# In[23]:


def Set_Password( password ):
    password_hash = passwd( password )
    os.system(f"""echo "c.NotebookApp.password = u'{password_hash}'" >> ~/.jupyter/jupyter_notebook_config.py""")


# <font color="red">NOTE:</font> The command `subprocess` is supposed to be better but I cant get it to work:
# ``` python
# import subprocess
# subprocess.call(["echo",f""" "c.NotebookApp.password = u'{password_hash}'" """,">>","~/.jupyter/jupyter_notebook_config.py"]) 
# ```

# In[10]:


if __name__ == "__main__":
    print("made it here")
    password = sys.argv[1]
    print("made it 2")
    Set_Password( password )
    print("made it 3")

