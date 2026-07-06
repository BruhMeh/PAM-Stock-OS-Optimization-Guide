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
