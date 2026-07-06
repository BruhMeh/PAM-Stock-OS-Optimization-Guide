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
