#!/bin/bash
export GUID=`hostname|awk -F. '{print $2}'`
export volsize=10Gi

for volume in pv{001..025} ; do
 cat << EOF | oc create -f -
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: "${volume}"
spec:
  capacity:
    storage: "${volsize}"
  accessModes:
  - ReadWriteMany
  - ReadWriteOnce
  nfs:
    path: "/srv/nfs/user-vols/${volume}"
    server: support1.${GUID}.internal
  persistentVolumeReclaimPolicy: Recycle
EOF
done
