


# 01-Introduction.md

# Introduction

Welcome to the **PAM Stock OS Optimization Guide**.

This guide is based on **Uri's original optimization guide**, expanding upon Cyberyellowninja's *Dark Arts Guide*. The Community Edition reorganizes the content into a structured Markdown format, improving readability, navigation and long-term maintainability while preserving the original technical recommendations.

The purpose of this guide is to optimize the **PAM Stock OS** for handheld gaming by reducing unnecessary background activity, improving battery life and maximizing emulation performance without sacrificing the Stock OS experience.

---

## Before You Begin

This guide assumes you are familiar with:

* Android Debug Bridge (ADB)
* Android Developer Options
* Shizuku
* Basic Android system configuration

If you are not comfortable using these tools, take some time to become familiar with them before continuing.

> [!WARNING]
> The optimizations described in this guide modify Android system behavior.
>
> Always review commands before executing them and make sure you understand their purpose.
>
> You are responsible for any changes made to your device.

---

## What This Guide Covers

The optimization process is divided into six sections:

1. **Debloating with Canta and Shizuku**
2. **Recommended System Settings**
3. **Advanced ADB Optimization Toolkit**
4. **Game Driver Configuration**
5. **Maintenance**
6. **Appendices**

Each section builds upon the previous one, and following the guide in order is strongly recommended.

---

## Optimization Goals

The recommendations in this guide are intended to:

* Reduce unnecessary background activity.
* Improve battery life.
* Reduce background memory usage.
* Improve emulator responsiveness.
* Preserve Google Play compatibility.
* Maintain the Stock OS experience.

Results may vary depending on:

* Firmware version
* Installed applications
* Emulator versions
* Individual usage patterns

---

## Recommended Workflow

For the best results, complete the guide in the following order:

1. Prepare the device.
2. Remove unnecessary packages using Canta.
3. Configure the recommended Android settings.
4. Apply the Advanced ADB optimizations.
5. Configure the Game Driver.
6. Reboot the device.
7. Verify system functionality.
8. Test your emulators.

Skipping steps may reduce the overall effectiveness of the optimization process.

---

> [!NOTE]
> Most optimizations only need to be applied once.
>
> After major firmware updates or a factory reset, some settings may need to be configured again.

---

## Documentation Philosophy

The Community Edition follows a simple editorial principle:

> **Preserve the knowledge. Improve the documentation.**

The objective is to make the guide easier to read, review and maintain without changing the original optimization strategy.

Whenever editorial changes have been made, they are limited to:

* Formatting
* Organization
* Grammar
* OCR corrections
* Documentation structure

The technical recommendations remain those of the original author unless explicitly documented.

---

## Credits

### Original Guide

**Uri**

Responsible for:

* Research
* Testing
* Optimization methodology
* Technical documentation

### Community Edition

**BruhMeh**

Responsible for:

* Editorial review
* Markdown conversion
* Documentation formatting
* OCR corrections
* Repository organization
* Publishing support

---

Continue to [[02-Canta-and-Shizuku]]





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

![Shizuku running](assets/screenshots/canta/shizuku-running.jpg)

*Shizuku should be running before continuing.*

---

## Grant Permission to Canta

Open **Canta**.

When prompted, grant permission through Shizuku.

Once permission has been granted, Canta will display the list of installed packages.

![Granting permission](assets/screenshots/canta/canta-packages-list.jpg)

*If permission was set correctly, this list of packages should show.*

---

## Selecting Packages

This screenshot shows all the recommended package selection.

Follow this list carefully.

![Package selection](assets/screenshots/canta/canta-setup.jpg)

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





# 03-System-Settings.md

# Recommended System Settings

Before applying the Advanced ADB optimizations, configure the following Android settings.

These changes reduce unnecessary background activity, improve battery life and complement the optimizations described later in this guide.

Most settings only need to be configured once.

---

## Google Account

### Disable Contact Synchronization

You will probably do not use contacts on your handheld, disable Google Contact Sync.
### Steps

1. Open **Settings**.
2. Navigate to **Accounts**.
3. Select your Google account.
4. Disable **Contacts** synchronization.

This prevents unnecessary background synchronization.

---

## Google Play

### Disable Play Protect

Google Play Protect continuously scans installed applications in the background.

If you only install trusted applications, disabling it reduces unnecessary CPU activity.

### Steps

1. Open **Google Play Store**.
2. Tap your profile picture.
3. Open **Play Protect**.
4. Disable **Scan apps with Play Protect**.

> [!TIP]
> **Uri's Recommendation**
>
> Install all trusted applications before disabling Play Protect.

---

## Location Services

### Disable Location

The device is dedicated to gaming, Location Services are generally unnecessary.

Disable:

* Location
* Google Location Accuracy
* Google Location Sharing

This prevents Android from continuously polling GPS and network-based location services.

---

### Disable Wi-Fi and Bluetooth Scanning

Android can continue scanning for nearby wireless devices even when Wi-Fi or Bluetooth are turned off.

Navigate to:

**Settings → Location → Location Services**

Disable:

* Wi-Fi Scanning
* Bluetooth Scanning

This reduces unnecessary wireless activity and battery consumption.

---

## Account Synchronization

### Disable Automatic Sync

Automatic synchronization periodically wakes the device to update cloud services.

Navigate to:

**Settings → Accounts**

Disable:

* Automatically sync app data

This prevents unnecessary background synchronization.

---

## System Logging

### Disable Logging

Diagnostic logging continuously records system events.

If you do not need diagnostic logs, disable the following options:

* Logging Level
* Logger Buffer Size

Both settings can be found using the Settings search function.

Disabling them reduces unnecessary storage activity and background CPU usage.

---

## Background Applications

### Restrict Background Battery Usage

Restrict background execution for applications that do not need to remain active.

For each user-installed application:

1. Open **Settings**.
2. Navigate to **Apps**.
3. Select the application.
4. Open **Battery**.
5. Set **Background Restriction** to **Restricted**.

Repeat this process for every application that does not require background execution.

> [!WARNING]
> Do **not** restrict your launcher or applications that must remain active in the background.

---

> [!TIP]
> **Uri's Recommendation**
>
> Uri recommends replacing the stock launcher with a dedicated frontend such as **ES-DE**, **Beacon Launcher** or another launcher designed for handheld gaming.

---

## Developer Options

### Disable Window Animations

Animations improve visual appearance but introduce unnecessary delays when navigating the interface.

Navigate to **Developer Options** and configure:

* Window Animation Scale → **Off**
* Transition Animation Scale → **Off**
* Animator Duration Scale → **Off**

Disabling animations improves the perceived responsiveness of the system.

---

### Keep Hardware Overlays Enabled

Do **not** disable **Hardware Overlays**.

Android's Hardware Composer already manages display composition efficiently.

> [!TIP]
> **Uri's Recommendation**
>
> Many Android optimization guides recommend disabling Hardware Overlays.
>
> During testing, Uri found no measurable benefit on the PAM. In some cases, disabling them may actually increase GPU workload.

---

## Before Continuing

Verify that:

* ☐ Play Protect is disabled.
* ☐ Location Services are disabled (if not required).
* ☐ Wi-Fi and Bluetooth scanning are disabled.
* ☐ Automatic synchronization is disabled.
* ☐ Logging is disabled.
* ☐ Background restrictions have been configured.
* ☐ Window animations are disabled.

The device is now ready for the [[04-01-Advanced-ADB-Toolkit]].





> [!WARNING]
> BELLOW THIS POINT THE GUIDE IS STILL PENDIGN REVISION. FOLLOW WITH CAUTION.

# 04-Advanced-ADB-Toolkit.md

# Advanced ADB Optimization Toolkit

The Advanced ADB Optimization Toolkit contains the core optimizations described in Uri's guide.

Unlike the previous chapters, these optimizations modify Android system behavior using **Android Debug Bridge (ADB)** commands.

Each optimization is independent unless otherwise noted, allowing you to apply only the changes that fit your workflow.

> [!WARNING]
> These commands modify Android system settings.
>
> Always review each command before executing it.
>
> Commands should be copied exactly as written.

---

# Google Play Services

Google Play Services is one of the most active background components in Android.

The following optimizations reduce unnecessary background activity while preserving normal application compatibility.

---

## Restrict Google Play Services

Restrict background execution and move Google Play Services to the **Restricted** App Standby Bucket.

This significantly reduces background CPU activity while maintaining compatibility with applications that depend on Google Play Services.

### Commands

```bash
adb shell cmd appops set com.google.android.gms RUN_IN_BACKGROUND ignore
adb shell am set-standby-bucket com.google.android.gms restricted
```

> [!TIP]
> **Uri's Recommendation**
>
> This is one of the highest-impact optimizations in the entire guide.

---

## Restrict Google Play Store

Restrict background execution of Google Play Store while preserving manual application installation and updates.

### Commands

```bash
adb shell cmd appops set com.android.vending RUN_IN_BACKGROUND ignore
adb shell am set-standby-bucket com.android.vending restricted
```

---

## Restrict Gboard

Prevent Gboard from performing unnecessary background work while preserving normal keyboard functionality.

### Commands

```bash
adb shell cmd appops set com.google.android.inputmethod.latin RUN_IN_BACKGROUND ignore
adb shell am set-standby-bucket com.google.android.inputmethod.latin restricted
```

---

## Restrict OTA Updater

Restrict background execution of the stock OTA updater.

Manual firmware updates remain available whenever required.

### Commands

```bash
adb shell cmd appops set com.ayaneo.update RUN_IN_BACKGROUND ignore
adb shell am set-standby-bucket com.ayaneo.update restricted
```

---

## Frontend Protection

Android may mark inactive applications for suspension during extended idle periods.

Protect your frontend so it remains available when returning from emulators.

### Daijisho (GitHub)

```bash
adb shell am set-inactive com.zykoo.daijishou false
```

### Daijisho (Google Play)

```bash
adb shell am set-inactive com.magneticchen.daijishou false
```

If you use another frontend, replace the package name accordingly.

---

# Performance Optimizations

The following optimizations improve application responsiveness while reducing unnecessary runtime work performed by Android.

Most of these commands only need to be executed once.

---

## Force Ahead-of-Time Compilation

Android normally compiles applications during execution using **Just-In-Time (JIT)** compilation.

This command recompiles installed applications using **Ahead-of-Time (AOT)** compilation, reducing runtime CPU usage and improving responsiveness.

### Command

```bash
adb shell cmd package compile -m speed -a
```

> [!TIP]
> **Uri's Recommendation**
>
> Run this command again after updating emulators or other performance-critical applications.

---

## Compile a Single Application

Instead of recompiling every installed application, you can recompile only the application that was recently updated.

### Command

```bash
adb shell cmd package compile -m speed -f <package_name>
```

Example:

```bash
adb shell cmd package compile -m speed -f com.retroarch
```

---

## Execute Background Package Optimization

Run Android's background package optimization immediately instead of waiting for the scheduled maintenance job.

### Command

```bash
adb shell cmd package bg-dexopt-job
```

---

## Disable Application Error Reports

Prevent Android from generating unnecessary application error reports.

### Command

```bash
adb shell settings put secure send_action_app_error 0
```

---

## Disable Security Reports

Prevent Android from generating background security reports.

### Command

```bash
adb shell settings put system send_security_reports 0
```

---

## Disable Background Sync During Battery Saver

Prevent automatic account synchronization while Battery Saver is enabled.

### Command

```bash
adb shell settings put global master_sync_allow_background_in_battery_saver 0
```

---

# System Resource Management

Android continuously schedules maintenance tasks, background jobs and alarms to support installed applications.

The following optimizations reduce unnecessary background activity while preserving normal system functionality.

---

## Reduce Background Job Scheduling

Limit the number of background jobs Android may execute simultaneously.

This helps reduce unnecessary CPU activity while maintaining normal foreground performance.

### Command

```bash
adb shell settings put global job_scheduler_quota_controller_max_job_count_bg 3
```

---

## Enable Cached App Freezer

Allow Android to freeze cached applications instead of terminating them.

Freezing inactive applications reduces memory pressure while allowing them to resume more efficiently when needed.

### Command

```bash
adb shell device_config put activity_manager_native_boot use_freezer true
```

---

## Prioritize System UI

Increase scheduling priority for Android's System UI.

This helps maintain a responsive interface during periods of high CPU utilization.

### Command

```bash
adb shell setprop sys.use_fifo_ui 1
```

---

## Disable Captive Portal Detection

Android periodically contacts connectivity servers to verify internet access.

If the device is primarily used for gaming, these checks are generally unnecessary.

### Command

```bash
adb shell settings put global captive_portal_mode 2
```

> [!TIP]
> **Uri's Recommendation**
>
> This optimization is particularly useful for handheld devices that rarely connect to public Wi-Fi networks requiring captive portal authentication.

---

## Trim Package Cache

Request Android to immediately reclaim unused package cache storage.

This command helps recover storage space after installing, updating or removing applications.

### Command

```bash
adb shell pm trim-caches 999G
```

---

## Reduce Alarm Wakeups

Adjust Alarm Manager timing parameters to reduce unnecessary device wakeups.

Fewer wakeups generally improve idle battery consumption.

### Command

```bash
adb shell settings put global alarm_manager_constants "allow_while_idle_short_time=10000,allow_while_idle_long_time=20000"
```

---

## Disable Activity Recognition

Prevent Google Play Services from continuously monitoring physical activity.

Most handheld gaming devices do not benefit from this functionality.

### Command

```bash
adb shell cmd appops set com.google.android.gms ACTIVITY_RECOGNITION ignore
```

---

## Disable Background Usage Statistics

Prevent Google Play Services from collecting application usage statistics.

### Command

```bash
adb shell cmd appops set com.google.android.gms GET_USAGE_STATS ignore
```

---

## Disable Device Identifier Access

Restrict unnecessary access to hardware identifiers.

### Command

```bash
adb shell cmd appops set com.google.android.gms READ_DEVICE_IDENTIFIERS ignore
```

---

## Background Resource Management

At this stage, Android should:

* Execute fewer background jobs.
* Wake the device less frequently.
* Freeze cached applications more efficiently.
* Reduce unnecessary CPU scheduling.
* Minimize background maintenance activity.

These optimizations primarily improve idle efficiency while preserving normal application compatibility.

---

## Verification

Before continuing:

* ☐ All commands executed successfully.
* ☐ No command returned an error.
* ☐ Google Play Store still opens correctly.
* ☐ Google Play Services continues to function normally.

If everything works as expected, continue with **Google Play Services Hardening**.






# Google Play Services Hardening

Google Play Services provides essential Android functionality, but it also performs a significant amount of background work.

The following optimizations reduce unnecessary background activity while preserving compatibility with applications that depend on Google Play Services.

> [!IMPORTANT]
> These optimizations are intended for a handheld gaming device running Stock OS.
>
> If you rely on Google location history, activity recognition or similar services, review each command before applying it.

---

## Disable Background Location Access

Prevent Google Play Services from continuously accessing location-related APIs.

If the device is primarily used for gaming, these services are generally unnecessary.

### Commands

```bash
adb shell cmd appops set com.google.android.gms FINE_LOCATION ignore
adb shell cmd appops set com.google.android.gms COARSE_LOCATION ignore
adb shell cmd appops set com.google.android.gms MONITOR_LOCATION ignore
adb shell cmd appops set com.google.android.gms MONITOR_HIGH_POWER_LOCATION ignore
```

---

## Disable Activity Recognition

Prevent Google Play Services from monitoring physical activity.

### Command

```bash
adb shell cmd appops set com.google.android.gms ACTIVITY_RECOGNITION ignore
```

---

## Disable Usage Statistics

Prevent Google Play Services from collecting application usage statistics.

### Command

```bash
adb shell cmd appops set com.google.android.gms GET_USAGE_STATS ignore
```

---

## Disable Device Identifier Access

Restrict unnecessary access to hardware identifiers.

### Command

```bash
adb shell cmd appops set com.google.android.gms READ_DEVICE_IDENTIFIERS ignore
```

---

## Disable Wi-Fi and Bluetooth Background Scanning

Prevent Google Play Services from continuously scanning nearby wireless devices.

### Commands

```bash
adb shell cmd appops set com.google.android.gms BLUETOOTH_SCAN ignore
adb shell cmd appops set com.google.android.gms NEIGHBORING_WIFI_SCAN ignore
```

---

## Restrict Wake Locks

Prevent Google Play Services from unnecessarily waking the device.

Reducing wake locks improves idle battery consumption.

### Command

```bash
adb shell cmd appops set com.google.android.gms WAKE_LOCK ignore
```

---

## Restrict Automatic Startup

Prevent Google Play Services from automatically starting unnecessary background components.

### Command

```bash
adb shell cmd appops set com.google.android.gms AUTO_START ignore
```

---

## Restrict Overlay Windows

Prevent Google Play Services from creating unnecessary system overlay windows.

### Command

```bash
adb shell cmd appops set com.google.android.gms SYSTEM_ALERT_WINDOW ignore
```

---

## Disable Google Feedback

Disable Google's feedback application.

### Command

```bash
adb shell pm disable-user --user 0 com.google.android.feedback
```

---

## Disable Google Turbo

Disable the Google Turbo service.

### Command

```bash
adb shell pm disable-user --user 0 com.google.android.apps.turbo
```

---

## Enable Sensor Privacy

Apply additional system-wide sensor privacy restrictions.

### Commands

```bash
adb shell settings put global sensor_privacy 1
adb shell settings put global wifi_scan_always_enabled 0
```

> [!TIP]
> **Uri's Recommendation**
>
> These commands complement the previous optimizations by reducing unnecessary sensor usage and wireless scanning while maintaining normal application compatibility.

---

# Expected Result

After completing this section, Google Play Services should:

* Generate fewer device wakeups.
* Perform fewer background scans.
* Poll location services less frequently.
* Reduce idle CPU activity.
* Consume less battery while the device is idle.

Normal Google Play functionality should remain available.

---

## Verification

Before continuing:

* ☐ Google Play Store still updates applications.
* ☐ Applications depending on Google Play Services continue to function.
* ☐ No unexpected permission dialogs appear.
* ☐ No recurring Google Play Services errors are displayed.

If any application requires functionality disabled by this section, revert only the corresponding optimization.

Continue with **Display & User Experience**.





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





# 05-Game-Driver.md

# Game Driver Configuration

After completing the system optimizations, configure the appropriate graphics driver for your emulators.

The Stock OS allows individual applications to use alternative graphics drivers, which may improve rendering performance and compatibility depending on the emulator and graphics API being used.

> [!IMPORTANT]
> Graphics driver behavior may vary depending on the firmware version, emulator version and graphics backend.
>
> Always test each emulator after changing its driver.

---

## Open Game Driver Preferences

Navigate to:

**Settings → System → Developer Options → Game Driver Preferences**

The list displays applications that support selecting an alternative graphics driver.


---

## Configure Each Emulator

Select each supported emulator individually.

Apply the graphics driver recommended in the original guide.

If multiple drivers are available, use the one specified for your device and firmware version.

Repeat the process for every emulator you actively use.

---

## Validate the Configuration

After changing the driver:

1. Launch the emulator.
2. Load a demanding game.
3. Allow gameplay for several minutes.
4. Observe overall stability.

Verify that:

* Graphics render correctly.
* Audio behaves normally.
* No graphical artifacts appear.
* Performance remains stable.
* No unexpected crashes occur.

---

> [!TIP]
> **Uri's Recommendation**
>
> If changing the graphics driver introduces graphical issues or instability, revert the emulator to the default system driver.

---

## Compatibility Notes

Different emulators may respond differently depending on:

* Android version
* Stock OS version
* GPU firmware
* Graphics driver version
* Graphics backend (Vulkan or OpenGL)

For this reason, always validate changes using the games you play most frequently.

---

## Final System Validation

At this point, verify that:

* The launcher starts normally.
* Google Play Store functions correctly.
* Google Play Services operates normally.
* All configured emulators launch successfully.
* No unexpected warnings or error messages are displayed.

---

# Optimization Complete

Congratulations.

You have completed the optimization process described in this guide.

Your device should now benefit from:

* Reduced background activity
* Lower idle battery consumption
* Improved system responsiveness
* Better resource availability for emulation
* A cleaner and more consistent Stock OS environment

Individual results may vary depending on firmware version, installed applications and emulator configuration.

---

# Ongoing Maintenance

Most optimizations only need to be performed once.

However, after major firmware updates, factory resets or significant application changes, review the following:

* Background restrictions
* Developer Options
* Game Driver configuration
* AOT compilation
* Google Play functionality

Reapply any settings that were reset.

---

## Completion Checklist

Before considering the process complete, confirm that:

* ☐ Device rebooted successfully.
* ☐ System boots without errors.
* ☐ Google Play Store works correctly.
* ☐ Google Play Services functions normally.
* ☐ Frontend launches correctly.
* ☐ All emulators tested successfully.
* ☐ Performance validated.
* ☐ Battery behavior validated.

You have successfully completed the **PAM Stock OS Optimization Guide**.

Continue to the **Appendices** for reference material, troubleshooting information and package references.





# 06-Appendices.md

# Appendices

This section contains reference material that complements the optimization guide.

The information presented here is intended for quick consultation during installation, maintenance and troubleshooting.

---

# Appendix A — Common Package Names

The following package names are referenced throughout this guide.

| Application            | Package Name                           | Notes                            |
| ---------------------- | -------------------------------------- | -------------------------------- |
| Google Play Services   | `com.google.android.gms`               | Core Google services             |
| Google Play Store      | `com.android.vending`                  | Google Play application          |
| Gboard                 | `com.google.android.inputmethod.latin` | Google Keyboard                  |
| Daijisho (Google Play) | `com.magneticchen.daijishou`           | Google Play version              |
| Daijisho (GitHub)      | `com.zykoo.daijishou`                  | GitHub release                   |
| RetroArch              | `com.retroarch`                        | Example used for AOT compilation |
| ES-DE                  | *Verify installed package name*        | Package name may vary            |
| Beacon Launcher        | *Verify installed package name*        | Package name may vary            |

---

# Appendix B — Common ADB Commands

The commands below are the most frequently used throughout this guide.

## Compile All Installed Applications

```bash
adb shell cmd package compile -m speed -a
```

---

## Compile a Single Application

```bash
adb shell cmd package compile -m speed -f <package_name>
```

Example:

```bash
adb shell cmd package compile -m speed -f com.retroarch
```

---

## Execute Background Package Optimization

```bash
adb shell cmd package bg-dexopt-job
```

---

## Trim Package Cache

```bash
adb shell pm trim-caches 999G
```

---

## Reboot the Device

```bash
adb reboot
```

---

# Appendix C — Glossary

## ADB

**Android Debug Bridge**

A command-line interface used to communicate with Android devices.

---

## AOT

**Ahead-of-Time Compilation**

A compilation method that prepares applications before execution, reducing runtime CPU usage.

---

## JIT

**Just-in-Time Compilation**

Applications are compiled while they are running instead of beforehand.

---

## App Standby Bucket

Android mechanism that determines how aggressively an application may execute background work.

---

## AppOps

Android permission management framework used to control specific application operations.

---

## Background Restriction

Android feature that limits background execution for selected applications.

---

## Canta

Application used together with Shizuku to remove or disable system packages without root access.

---

## Developer Options

Advanced Android configuration menu intended for developers and power users.

---

## Shizuku

Application that allows supported apps to access privileged Android APIs without requiring root access.

---

## SurfaceFlinger

Android system compositor responsible for rendering and composing the display.

---

## Hardware Composer

Android component responsible for efficiently composing graphical layers before displaying them.

---

## Wake Lock

Android mechanism that allows an application to keep the CPU awake while performing background work.

---

# Troubleshooting

## Google Play Store Does Not Update Applications

Verify that:

* Google Play Services remains enabled.
* Google Play Store has not been disabled.
* Network connectivity is available.
* Automatic date and time are configured correctly.

If necessary, temporarily revert the corresponding optimization and test again.

---

## Google Play Services Displays Errors

Review the **Google Play Services Hardening** section.

If required, revert the most recently applied optimization and verify whether the issue is resolved.

---

## Emulator Performance Did Not Improve

Performance improvements depend on multiple factors, including:

* Emulator version
* Graphics driver
* Graphics backend (Vulkan or OpenGL)
* Firmware version
* Game compatibility

Not every emulator or game will benefit equally from every optimization.

---

## System Behaves Unexpectedly

If an issue appears after applying an optimization:

1. Identify the most recent change.
2. Revert only that specific optimization.
3. Test the device again.

Avoid reverting unrelated optimizations.

---

## Firmware Update Reset Some Settings

Major firmware updates may restore default Android configuration.

Review the following chapters:

* Recommended System Settings
* Advanced ADB Optimization Toolkit
* Game Driver Configuration

Reapply any settings that were reset.

---

# Credits

## Original Guide

**Uri**

Original research, testing methodology, optimization strategy and technical documentation.

---

## Community Edition

**BruhMeh**

Editorial review, Markdown conversion, documentation formatting, OCR corrections, repository organization and publishing support.

---

# Final Notes

The purpose of this Community Edition is to preserve the original optimization guide while making it easier to read, review and maintain.

Technical recommendations remain those of the original author unless explicitly documented.

Community contributions should prioritize:

* Accuracy
* Readability
* Maintainability
* Respect for the original work

Thank you for helping preserve and improve this documentation.


