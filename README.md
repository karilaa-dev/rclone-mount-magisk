<h1 align="center">Cloud Storage Mounter for Magisk (prev: rclone-mount)</h1>

<div align="center">
  <!-- Version -->
    <img src="https://img.shields.io/badge/Version-v1.15-blue.svg?longCache=true&style=for-the-badge"
      alt="Version" />
  <!-- Last Updated -->
    <img src="https://img.shields.io/badge/Updated-January 3, 2026-green.svg?longCache=true&style=for-the-badge"
      alt="_time_stamp_" />
  <!-- Min Magisk -->
    <img src="https://img.shields.io/badge/Magisk-20.0%2B-red.svg?longCache=true&style=for-the-badge"
      alt="_time_stamp_" /></div>

<p align="center">
  Mount and sync your cloud storage on your Android device using <code>rclone</code> & <code>fusermount3</code>, providing virtually limitless storage expansion with support for dozens of cloud providers.
</p>

---

### Supported Android Versions

| Android Version | API Level | Status |
|-----------------|-----------|--------|
| Android 11+     | API 30+   | Fully supported (uses fusermount3) |
| Android 7-10    | API 24-29 | Supported (legacy fusermount) |
| Android 5-6     | API 21-23 | May work, not officially tested |

> **Note:** This module requires Magisk 20.0+, KernelSU, or APatch.

### Features
- Support for arm, arm64, & x86 (64bit too)
- Huge list of [supported cloud storage providers](https://rclone.org/#providers)
- Apps with ability to specify paths can access the remotes at `/mnt/cloud/`.
- Most file explorers work just fine ([read more on this](https://github.com/Magisk-Modules-Repo/com.piyushgarg.rclone/issues/9)).
- Mount points use names of remote(s) in rclone.conf
- Specify custom rclone params for each remote via `/sdcard/.rclone/.REMOTE.param`
- Access remotes via HTTP or (S)FTP clients, or bind the remotes to `/sdcard/Cloud/REMOTE` (recommended to [read this](https://github.com/Magisk-Modules-Repo/com.piyushgarg.rclone/issues/5)).
- Support for Work Profiles.

### Recent Changes

#### v1.15
- Updated for Android 11+ (API 30+) compatibility
- Upgraded from `fusermount` to `fusermount3` for modern Android support
- Updated all binaries to latest versions:
  - `rclone` v1.72.1
  - `fusermount3` (from fuse3)
  - `inotifywait` (latest from Termux)
  - `libandroid-support.so` (latest from Termux)
- Added GitHub Actions for automated binary updates and releases

#### v1.14
- Used @Zackptg5's MMT-EX module template
- Cleaned all install & wrapper scripts
- Fixed bugs related to `rclone` command not working
- Restored x86 and x86_64 support
- Updated all binaries from Termux builds

For full changelog, see [CHANGELOG.md](CHANGELOG.md).

### Configuration
1. Copy your `rclone.conf` file (if you have one already) to `/sdcard/.rclone/rclone.conf` (can always be generated later.)
2. Add custom params at `/sdcard/.rclone/.[global/REMOTE].param` (if needed)
3. Install the module via Magisk Manager
4. Run `rclone config` via term if additional setup required
4. All your rclone mount points will show up under `/mnt/cloud/` & `/storage/cloud/` or `/sdcard/cloud/`

For more detailed configuration of rclone please refer to [official documentation](https://rclone.org)

### Known Issues
- VLC  takes a long time to load media as it opens file in write mode when using it's internal browser.

   a. Create remote type alias for media dirs in rclone.conf and
specify `CACHEMODE=off` in `/sdcard/.rclone/.ALIASNAME.param`

- Encrypted devices can not mount until unlock
- Encrypted `rclone.conf` causes reboots
- High cpu/mem in some apps with storage perms ([issue #9](https://github.com/Magisk-Modules-Repo/com.piyushgarg.rclone/issues/9))
- The `fusermount3` bin may not be compatible on all devices (see [thread](https://www.google.com/amp/s/forum.xda-developers.com/android/development/fusermount-android-rclone-mount-t3866652/amp/))

## Disclaimer
- Neither the author nor devs will be held responsible for any damage/data loss that may occur during use of this module.
- While we have done our best to make sure no harm will come about, no guarantees can be made.
- Keep in mind the binaries included in this project are BETA quality (at best), which may cause unforseen issues.

Always check this document before updating to new releases as significant changes may occur.

## Credits

### Original Projects
- [rclone-mount by AvinashReddy3108](https://github.com/AvinashReddy3108/rclone-mount-magisk) - Source repository this fork is based on
- [Original rclone-mount module by piyushgarg](https://github.com/Magisk-Modules-Repo/com.piyushgarg.rclone) - The original Magisk module

### Contributors & Resources
- [rclone](https://rclone.org) developers
- pmj_pedro [@xda](https://forum.xda-developers.com/showpost.php?p=78147335&postcount=1)
- agnostic-apollo [@xda](https://forum.xda-developers.com/showpost.php?p=79929083&postcount=12)
- [Termux](https://termux.dev) for building and hosting binaries:
  - [rclone](https://packages.termux.org/apt/termux-main/pool/main/r/rclone)
  - [fusermount3 (fuse3)](https://packages.termux.dev/apt/termux-main/pool/main/f/fuse3/)
  - [inotifywait](https://packages.termux.org/apt/termux-main/pool/main/i/inotify-tools)
  - [libandroid-support.so](https://packages.termux.org/apt/termux-main/pool/main/liba/libandroid-support)
- geofferey @github for improvements
- [@Zackptg5](https://github.com/Zackptg5) for MMT-EX Module template
