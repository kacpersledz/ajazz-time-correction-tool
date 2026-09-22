# ajazz-time-correction-tool

Synchronizes the clock of an Ajazz AK820 keyboard over HID.

## Nix / NixOS

Run directly from GitHub:

```bash
nix run github:kacpersledz/ajazz-time-correction-tool
```

Or build the package explicitly:

```bash
nix build github:kacpersledz/ajazz-time-correction-tool
./result/bin/ajazz-time-correction-tool
```

The Nix package provides the native runtime dependencies, but the process still needs read/write access to the target `/dev/hidraw*` device. Configure an appropriate udev rule when running as a regular user.
