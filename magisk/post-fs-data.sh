#!/system/bin/sh

MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"
MAGISKTMP="$(magisk --path)" || MAGISKTMP=/sbin

# Remove Play Services from the Magisk Denylist when set to enforcing.
if magisk --denylist status; then
	magisk --denylist rm com.google.android.gms
fi

if [ ! -e "$MAGISKTMP/.magisk/mirror/sepolicy.rules/$MODNAME/sepolicy.rule" ] && [ ! -e "$MAGISKTMP/.magisk/sepolicy.rules/$MODNAME/sepolicy.rule" ]; then
    magiskpolicy --live --apply "$MODDIR/sepolicy.rule"
fi

. "$MODDIR/resetprop.sh"

replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"