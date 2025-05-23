#!/usr/bin/env bash

## activate venv for sphinx functionality
source venv312/Scripts/activate

# remove previous builds to avoid cache issues
rm -rf docs/_build docs/jupyter_execute

# copy files at root to docs/ folder
cp examples/tutorial.ipynb docs/userdocs/tutorial.ipynb
cp CHANGELOG.md docs/devdocs/changelog.md
cp CODE_OF_CONDUCT.md docs/devdocs/code_of_conduct.md
cp CONTRIBUTING.md docs/devdocs/contributing.md

# generate api
sphinx-apidoc -f -o docs/apidocs src/crisprzip --separate

#build
sphinx-build docs docs/_build
