# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=natrium
device.name2=Natrium
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chmod -R 755 $ramdisk/sbin;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# test script
#insert_line init.qcom.rc "init.rodries.rc" after "import init.target.rc" "import init.test.rc";
#insert_line init.rc "init.rodries.rc" before "import /init.usb.configfs.rc" "import /init.rodries.rc";

# end ramdisk changes

write_boot;

## end install
