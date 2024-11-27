# Dependencies
sudo apt install python3-gi python3-gi-cairo gir1.2-gtk-3.0 gir1.2-webkit2-4.1 libgirepository1.0-dev python3.10


# PATHS
export ARCHEV_ROOT=`pwd`


# Pywebview
python3.10 -m venv .venv
source $ARCHEV_ROOT/.venv/bin/activate
pip3 install wheel pywebview pygobject
CMAKE_ARGS="-DGGML_VULKAN=1" pip install llama-cpp-python


# Directories
mkdir tmp

