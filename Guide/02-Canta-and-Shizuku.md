# 02-Canta-and-Shizuku.md

# Debloating with Canta and Shizuku

Removing unnecessary system applications is one of the most effective ways to reduce background activity, improve battery life and free system resources for emulation.

This guide uses **Shizuku** together with **Canta** to safely uninstall or disable packages without requiring root access.

> [!IMPORTANT]
> The package selections in this guide are based on Uri's tested configuration.
>
> Review every package before removing it and keep any application that you personally use.

---

## Prerequisites

Before continuing, make sure the following requirements are met:

* Developer Options are enabled.
* USB Debugging is enabled.
* Wireless Debugging is enabled.
* Shizuku is installed.
* Canta is installed.

---

## Start the Shizuku Service

Launch **Shizuku**.

Verify that the service is running correctly before opening Canta.

If this is your first time using Shizuku:

1. Pair the device using Wireless Debugging.
2. Start the Shizuku service.
3. Confirm that the status is **Running**.

![Shizuku running](../assets/screenshots/canta/shizuku-running.jpg)

*Shizuku should be running before continuing.*

---

## Grant Permission to Canta

Open **Canta**.

When prompted, grant permission through Shizuku.

Once permission has been granted, Canta will display the list of installed packages.

![Granting permission](../assets/screenshots/canta/canta-packages-list.jpg)

*If permission was set correctly, this list of packages should show.*

---

## Selecting Packages

This screenshot shows all the recommended package selection.

Follow this list carefully.

![Package selection](../assets/screenshots/canta/canta-setup.jpg)

*Example of recommend package selection.*

---

## Package Categories

For readability, packages are grouped into logical categories.

### System Applications

Applications that are not required for a typical handheld gaming experience.

Examples include:

```text
com.android.music
com.android.egg
com.android.dreams.basic
com.android.emergency
```

---

### Google Components

Optional Google applications and services that are not required by every user.

Examples include:

```text
com.google.android.apps.restore
com.google.android.syncadapters.contacts
com.google.android.syncadapters.calendar
```

Only remove these packages if you do not use the associated functionality.

---

### Android Components

Optional Android components that can safely be removed.

Examples include:

```text
com.android.providers.partnerbookmarks
com.android.wallpaperbackup
com.android.wallpapercropper
```

---

### Android Themes

Android theme assets components that can safely be removed, but affect some of the UI.

Examples include:

```text
com.android.theme.icon.taperedrect
com.android.theme.icon.teardrop
com.android.theme.icon.vessel
```

---
### Overlay Packages

Remove only the overlay packages recommended.

If you are unsure whether an overlay is currently in use, leave it installed.

---

> [!TIP]
> **Uri's Recommendation**
>
> Use the screenshot as the primary source of truth when selecting packages.
>
> It reflect the configuration tested during development of the guide.

---

## Why Debloat?

Removing unnecessary packages reduces:

* Background CPU usage
* Background memory usage
* Idle battery consumption
* Background services
* System wakeups

A cleaner system leaves more resources available for emulators and frontend applications.

---

## Reboot the Device

After completing the debloat process:

1. Restart the device.
2. Wait for Android to finish booting.
3. Confirm that the launcher opens normally.
4. Verify that Google Play Store still functions correctly.

---

## Verification Checklist

Before continuing, verify that:

* ☐ Device booted successfully.
* ☐ Launcher opens normally.
* ☐ Google Play Store works correctly.
* ☐ Essential applications still function.
* ☐ No unexpected crashes occurred.

If everything works as expected, continue with **[[03-System-Settings]]**.
