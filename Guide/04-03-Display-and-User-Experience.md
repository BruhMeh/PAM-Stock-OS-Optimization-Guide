# Display & User Experience

The final optimizations focus on improving interface responsiveness while preserving the Stock OS experience.

Unlike previous sections, these changes primarily affect the user interface rather than background system behavior.

---

## Disable Window Animations

Android animations improve visual appearance but introduce unnecessary delays during navigation.

Navigate to:

**Settings → Developer Options**

Configure the following options:

* Window Animation Scale → **Animation Off**
* Transition Animation Scale → **Animation Off**
* Animator Duration Scale → **Animation Off**

Disabling these animations makes application launches and system navigation feel significantly more responsive.

---

## Keep Hardware Overlays Enabled

Some Android optimization guides recommend disabling Hardware Overlays.

For the PAM, this is **not recommended**.

Android's Hardware Composer already manages display composition efficiently.

> [!TIP]
> **Uri's Recommendation**
>
> Leave **Disable HW Overlays** turned **off**.
>
> During testing, disabling Hardware Overlays provided no measurable performance improvement and, in some scenarios, increased GPU workload.

---

## SurfaceFlinger Optimizations

Some firmware versions expose additional rendering properties through SurfaceFlinger.

Only apply SurfaceFlinger commands that are explicitly supported by your firmware version and documented in the original guide.

Do not attempt to enable undocumented properties.

---

## Reboot the Device

After completing all Advanced ADB optimizations, restart the device.

Rebooting ensures that all modified services reload using their updated configuration.

---

# Final Validation

After the device finishes booting:

Verify that:

* Google Play Store opens normally.
* Google Play Services operates correctly.
* Your frontend launches successfully.
* Installed emulators open normally.
* No unexpected error messages appear.

Launch one or more demanding games to confirm that:

* Performance is stable.
* No graphical artifacts are present.
* Audio behaves normally.
* Input latency feels consistent.
* Battery consumption during idle has improved.

---

# Troubleshooting

## Google Play Store Stops Updating

Verify that:

* Google Play Services remains installed.
* Google Play Store has not been disabled.
* Network connectivity is available.
* Automatic date and time are configured correctly.

If necessary, temporarily revert the related Google Play Services optimization and test again.

---

## Unexpected Application Behavior

If an application behaves unexpectedly after applying an optimization:

1. Identify the optimization related to that application.
2. Revert only that specific change.
3. Test the application again.

Avoid reverting unrelated optimizations.

---

## Increased Battery Consumption

Major firmware updates may restore default Android behavior.

Review:

* Recommended System Settings
* Google Play Services optimizations
* Background restrictions

Reapply any settings that were reset by the update.

---

# Maintenance

Most optimizations only need to be applied once.

However, consider the following maintenance tasks:

## After Updating an Emulator

Recompile the updated application.

```bash
adb shell cmd package compile -m speed -f <package_name>
```

---

## After Major Firmware Updates

Review:

* Developer Options
* Background Restrictions
* Google Play Services functionality

Some settings may need to be reconfigured.

---

## Periodic Review

Occasionally verify that:

* Background restrictions are still applied.
* Newly installed applications are configured appropriately.
* Google Play Services continues functioning as expected.

---

# Completion Checklist

Before considering the optimization process complete:

* ☐ Device successfully rebooted.
* ☐ Google Play Store functioning normally.
* ☐ Google Play Services functioning normally.
* ☐ Frontend launching correctly.
* ☐ Emulators functioning correctly.
* ☐ Performance validated.
* ☐ Battery behavior validated.

Congratulations.

You have completed the **Advanced ADB Optimization Toolkit**.

Continue with **05 – Game Driver Configuration**.
