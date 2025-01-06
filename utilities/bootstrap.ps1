helm install config-nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner `
    --set nfs.server=10.0.0.199 `
    --set nfs.path=/run/nfs4/backup/bakery-configs `
    --set storageClass.name=config-nfs-client `
    --set storageClass.provisionerName=k8s-sigs.io/config-nfs-subdir-external-provisioner `
    -n bakery-media

helm install media-nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner `
    --set nfs.server=10.0.0.199 `
    --set nfs.path=/run/nfs4/cooling-rack/plex `
    --set storageClass.name=media-nfs-client `
    --set storageClass.provisionerName=k8s-sigs.io/media-nfs-subdir-external-provisioner `
    -n bakery-media
