DEBIAN_FRONTEND=noninteractive sudo apt-get -y update
DEBIAN_FRONTEND=noninteractive sudo apt-get upgrade -y

# Get External IP of this Instance
externalip=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)

# Clone devstack Pike repo

git clone https://git.openstack.org/openstack-dev/devstack

cd devstack

# Prepare 'local.conf'
cat <<- EOF > local.conf
[[local|localrc]]
# Set basic passwords
ADMIN_PASSWORD=openstack
DATABASE_PASSWORD=openstack
RABBIT_PASSWORD=openstack
SERVICE_PASSWORD=openstack
EOF

./stack.sh

echo "You can access Horizon Dashboard at External IP address: http://$externalip/dashboard"
