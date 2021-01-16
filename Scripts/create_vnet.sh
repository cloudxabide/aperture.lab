#!/bin/bash

# Set some vars
NETWORK_NAME=ocp4
BRIDGE_NAME=${NETWORK_NAME}br
NETWORK_FILE=/tmp/${NETWORK_NAME}.xml

# Create a Virtual Network configuration
cat << EOF > ${NETWORK_FILE}
<network>
  <name>$NETWORK_NAME</name>
  <uuid>$(uuidgen)</uuid>
  <forward mode='nat'/>
  <bridge name='${BRIDGE_NAME}' stp='on' delay='0'/>
  <mac address='52:54:00:$(echo $FQDN|md5sum|sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/02:\1:\2/')'/>
  <ip address='192.168.126.1' netmask='255.255.255.0'>
  </ip>
</network>
EOF

virsh net-define --file ${NETWORK_FILE}
virsh net-autostart ${NETWORK_NAME}
virsh net-start ${NETWORK_NAME}

exit 0


# Create the Virtual Network from the file (transient, won't survive reboot)
virsh net-create --file ${NETWORK_FILE}
virsh net-list 

# cleanup
# virsh net-destroy ${NETWORK_NAME}

