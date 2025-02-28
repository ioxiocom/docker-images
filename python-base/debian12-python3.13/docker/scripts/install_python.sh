#!/usr/bin/env bash

# shellcheck disable=SC2016
set -exuo pipefail

# Install pyenv
curl -fsSL https://pyenv.run | bash

echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init - bash)"' >> ~/.profile


[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

pyenv install "${PYTHON_VERSION}"
pyenv global "${PYTHON_VERSION}"

update-alternatives --install /usr/bin/python python "$(pyenv which "python${PYTHON_VERSION}")" 10
