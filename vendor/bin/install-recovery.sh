#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery$(getprop ro.boot.slot_suffix):33554432:624cdd6fdc032195fcbf4ab03d7c904e8ee3117c; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/soc/11230000.mmc/by-name/boot$(getprop ro.boot.slot_suffix):33554432:9c52854a9ce3f84ba886bedf3e5f47e76b180604 \
          --target EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery$(getprop ro.boot.slot_suffix):33554432:624cdd6fdc032195fcbf4ab03d7c904e8ee3117c && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
