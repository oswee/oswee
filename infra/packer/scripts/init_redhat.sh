#!/bin/bash

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Prepares a RedHat guest operating system.

export BUILD_USERNAME
export BUILD_KEY

### Update the default local user. ###
echo '> Updating the default local user ...'
echo '> Adding authorized_keys for the default local user ...'
sudo mkdir -p /home/$BUILD_USERNAME/.ssh
sudo cat << EOF > /home/$BUILD_USERNAME/.ssh/authorized_keys
$BUILD_KEY
EOF
sudo chown -R $BUILD_USERNAME /home/$BUILD_USERNAME/.ssh
sudo chmod 700 /home/$BUILD_USERNAME/.ssh
sudo chmod 644 /home/$BUILD_USERNAME/.ssh/authorized_keys
echo '> Adding the default local user to passwordless sudoers...'
sudo bash -c "echo \"$BUILD_USERNAME ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers"

### Configure SSH for Public Key Authentication. ###
echo '> Configuring SSH for Public Key Authentication ...'
sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/.*PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
### Disable Password Authentication and enforce _only_ Public Key Authentication. ###
sudo sed -i 's/PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

### Done. ###
echo '> Done.'
