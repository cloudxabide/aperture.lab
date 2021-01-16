#!/bin/bash

POOL_NAME=ISOS
POOL_FILE=/tmp/${POOL_NAME}.xml

cat << EOF > ${POOL_FILE}
<pool type='dir'>
  <name>ISOS</name>
  <uuid>$(uuidgen)</uuid>
  <source>
  </source>
  <target>
    <path>/home/ISOS</path>
    <permissions>
      <mode>0755</mode>
      <owner>0</owner>
      <group>0</group>
      <label>system_u:object_r:virt_image_t:s0</label>
    </permissions>
  </target>
</pool>
EOF

virsh pool-define ${POOL_FILE}
virsh pool-autostart ${POOL_NAME}
virsh pool-list

