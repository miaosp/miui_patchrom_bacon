#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7690240 6ea98046250ea9ba37ea2baeabee49c6c655febb 5711872 b925be7e13ccfe3e06144a7616d71b67b02717d4
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:7690240:6ea98046250ea9ba37ea2baeabee49c6c655febb; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5711872:b925be7e13ccfe3e06144a7616d71b67b02717d4 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 6ea98046250ea9ba37ea2baeabee49c6c655febb 7690240 b925be7e13ccfe3e06144a7616d71b67b02717d4:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
