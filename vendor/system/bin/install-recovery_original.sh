#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 21907456 1b28e436c22a5a9921709eebc8a2a58b413cf4b2 18796544 cac5f86af0845d056087bff45a792c1393a78b28
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:21907456:1b28e436c22a5a9921709eebc8a2a58b413cf4b2; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:18796544:cac5f86af0845d056087bff45a792c1393a78b28 EMMC:/dev/block/bootdevice/by-name/recovery 1b28e436c22a5a9921709eebc8a2a58b413cf4b2 21907456 cac5f86af0845d056087bff45a792c1393a78b28:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
