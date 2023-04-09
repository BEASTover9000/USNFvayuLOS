# How does Universal SafetyNet Fix work?

Since January 12, 2021, Google Play Services opportunistically uses hardware-backed attestation to improve SafetyNet integrity. It also enforces usage based on the device model name since September 2, 2021.

This module uses Zygisk to inject code into the Play Services process and register a fake keystore provider that overrides the real one. When Play Services attempts to use key attestation, it throws an exception and pretends that the device lacks support for key attestation. This causes SafetyNet to fall back to basic attestation, which is much weaker and can be bypassed with existing methods.

In order to hide kustom room status from detection apps you need to rename addon.d folder to random name in system partion, It is recommended to rename again to addon.d before updating/upgrading the room.

However, blocking key attestation alone does not suffice because basic attestation fails on devices that are known by Google to support hardware-backed attestation. This module bypasses the check by appending a space character to the device model name. This has minimal impact on UX when only applied to Play Services, but it's sufficient for bypassing enforcement of hardware-backed attestation.

This doesn't break other features because key attestation is only blocked for Play Services, and even within Play Services, it's only blocked for SafetyNet code. As a result, other attestation-based features (such as using the device as a security key) continue to work.
