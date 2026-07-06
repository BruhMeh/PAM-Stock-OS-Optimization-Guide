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
