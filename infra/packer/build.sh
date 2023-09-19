#!/usr/bin/env bash

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -e

follow_link() {
  FILE="$1"
  while [ -h "$FILE" ]; do
    # On Mac OS, readlink -f doesn't work.
    FILE="$(readlink "$FILE")"
  done
  echo "$FILE"
}

# TODO: How to abstract home path?
VAGRANT_BOX_PATH=/mnt/data/registry/vagrant/boxes
SCRIPT_PATH=$(realpath "$(dirname "$(follow_link "$0")")")
CONFIG_PATH=$(realpath "${1:-${SCRIPT_PATH}/config}")

mkdir -p "$VAGRANT_BOX_PATH"

menu_option_1() {
  INPUT_PATH="$SCRIPT_PATH"/builds/base-image
  echo -e "\nCONFIRM: Build a Base Image Template for QEMU?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  echo "Building a Base Image Template for QEMU..."

  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  echo "Starting the HashiCorp Packer build..."
  PKR_VAR_VAGRANT_BOX_PATH=$VAGRANT_BOX_PATH \
  # packer build -only=qemu.* -force \
  packer build -force \
      -var-file="$CONFIG_PATH/qemu.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/vagrant.pkrvars.hcl" \
      "$INPUT_PATH"

  echo "Done."
}

menu_option_2() {
  INPUT_PATH="$SCRIPT_PATH"/builds/ci-image
  echo -e "\nCONFIRM: Build a CI Image Template for QEMU?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  echo "Building a CI Image Template for QEMU..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  echo "Starting the HashiCorp Packer build..."
  PKR_VAR_VAGRANT_BOX_PATH=$VAGRANT_BOX_PATH \
  # packer build -only=qemu.* -force \
  packer build -force \
      -var-file="$CONFIG_PATH/qemu.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      "$INPUT_PATH"

  echo "Done."
}

menu_option_3() {
  INPUT_PATH="$SCRIPT_PATH"/builds/fedora/Server-netinst-35
  echo -e "\nCONFIRM: Build a Fedora 35 Server-netinst Template for QEMU?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Fedora 35 Server-netinst Template for QEMU. ###
  echo "Building a Fedora 35 Server-netinst Template for QEMU..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the HashiCorp Packer Build ###
  echo "Starting the HashiCorp Packer build..."
  PKR_VAR_VAGRANT_BOX_PATH=$VAGRANT_BOX_PATH \
  packer build -only=qemu.* -force \
      -var-file="$CONFIG_PATH/qemu.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      # -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      "$INPUT_PATH"

  echo "Done."
}

menu_option_4() {
  INPUT_PATH="$SCRIPT_PATH"/builds/fedora/Server-netinst-37
  echo -e "\nCONFIRM: Build a Fedora 37 Server-netinst Template for QEMU?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Fedora 37 Template for QEMU. ###
  echo "Building a Fedora 37 Server-netinst Template for QEMU..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the HashiCorp Packer Build ###
  echo "Starting the HashiCorp Packer build..."
  PKR_VAR_VAGRANT_BOX_PATH=$VAGRANT_BOX_PATH \
  # packer build -only=qemu.* -force \
  packer build -force \
      -var-file="$CONFIG_PATH/qemu.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      "$INPUT_PATH"

  echo "Done."
}

press_enter() {
  cd "$SCRIPT_PATH"
  echo -n "Press Enter to continue."
  read -r
  clear
}

incorrect_selection() {
  echo "Do or do not. There is no try."
}

until [ "$selection" = "0" ]; do
  clear
  echo -n "  Select a Packer build:"
  echo ""
  echo ""
  echo "      Linux Distribution:"
  echo ""
  echo "        1  -  Base Image (QEMU)"
  echo "        2  -  CI Image (QEMU)"
  echo "        3  -  Fedora 35 Server-netinst (QEMU)"
  echo "        4  -  Fedora 37 Server-netinst (QEMU)"
  echo ""
  echo "      Other:"
  echo ""
  echo "        q   -  Quit"
  echo ""
  read -r selection
  echo ""
  case $selection in
    1 ) clear ; menu_option_1 ; press_enter ;;
    2 ) clear ; menu_option_2 ; press_enter ;;
    3 ) clear ; menu_option_3 ; press_enter ;;
    4 ) clear ; menu_option_4 ; press_enter ;;
    q ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
