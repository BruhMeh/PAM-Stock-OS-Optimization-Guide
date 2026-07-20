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

## FPS Lock for better performance

VSync can forces games to dip bellow 60Hz to save power. You can use ADB to override the peak and minimum refresh rates, which forces VSync to sync at the highest possible panel speed (e.g., 60Hz for the PAM):

```bash
adb shell settings put global peak_refresh_rate 60.0
adb shell settings put global min_refresh_rate 60.0
```

---

## SurfaceFlinger Optimizations

> [!CAUTION]
> DO NOT DO THIS ON OLED DEVICES OR SCREENS WITH MORE THAN 60HZ PANEL SPEEDS!

This command instructs the SurfaceFlinger service, which handles how Android draws images on the screen, to bypass vertical synchronization (VSync). By disabling VSync, you
eliminate the "wait time" where the system holds a frame until the screen is ready to refresh. This results in a direct, snappier feel for your controls, which is highly beneficial for fast-paced action or retro games where input precision is key.

>[!WARNING]
>Disabling it can cause some screen tearing and increase battery usage, do apply with these caveats in mind.
>


```bash
adb shell su -c "service call SurfaceFlinger 1008 i32 1"
```

>[!NOTE]
>You need to have root privileges to execute this command, magisk or your root manager could ask you to confirm the operation on your device screen.
>

In case you want to enable it again you can simply use:

```bash
adb shell su -c "service call SurfaceFlinger 1008 i32 0"
```

> [!TIP]
> **Uri's Toughts**
>
> The biggest benefit of all is that this seems to help with ghosting, I dont notice it at all, after disabling it!
> 
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
