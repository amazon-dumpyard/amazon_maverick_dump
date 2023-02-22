#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:15251456:b114ba7aad6c0d3a9596be8b80c8674f38fbcbbf; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9854976:de3ac5d886f2626d0eab4a9d21bbada8f1260197 EMMC:/dev/block/platform/bootdevice/by-name/recovery e6e17c53b9951ce88124c78f4889a4dbf45b4c10 15249408 de3ac5d886f2626d0eab4a9d21bbada8f1260197:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=15249408 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
