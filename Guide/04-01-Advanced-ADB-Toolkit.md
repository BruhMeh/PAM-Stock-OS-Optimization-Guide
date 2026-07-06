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

