#!/bin/bash

# Script to recursively remove all dependencies from a Python VENV
# then reinstall cleanly from the requirements.txt file

pip install --upgrade pip
pip freeze | xargs pip uninstall -y
pip cache purge
pip install -r requirements.txt
