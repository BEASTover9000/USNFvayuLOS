#!/system/bin/sh

MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"

# Remove Play Services from the Magisk Denylist when set to enforcing.
if magisk --denylist status; then
	magisk --denylist rm com.google.android.gms
fi

. "$MODDIR/resetprop.sh"

replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"