# AriJB

AriJB is an iOS device-diagnostics and security-research scaffold. It is **not a jailbreak** and contains no exploit chain, privilege-escalation payload, kernel patch, or persistence mechanism.

## Operator-reported target
- Device: iPhone 16e
- OS: iOS 27.0
- Reported build: `24A5380h` (not independently verified)
- Desired model: semi-untethered; not implemented

The operator reports MobileGestalt edits. The app therefore reads the hardware identifier using `uname()` and the kernel build using `sysctlbyname("kern.osversion")`, rather than trusting the Settings marketing label.

## Layout
- `App/AriJB`: SwiftUI diagnostics app
- `Core`: portable C library
- `Tests`: native C smoke test
- `Research`: evidence ledger
- `.github/workflows/ios-build.yml`: Ubuntu C tests and hosted macOS Xcode build

## Linux tests
```sh
cmake -S Core -B build/core -DCMAKE_BUILD_TYPE=Release
cmake --build build/core --parallel
cc -std=c11 -Wall -Wextra -Werror -ICore/include Tests/test_core.c Core/src/arijb_core.c -o build/test_core
./build/test_core
```

## iOS build
GitHub Actions uses a hosted `macos-15` runner. The app is built unsigned; installing on a physical iPhone still requires valid signing and provisioning.

## Research discipline
Record exact hardware identifier, OS build, kernel build, and test conditions. Separate operator-reported claims, source-reported claims, reproduced facts, and inference. Never commit serial numbers, account identifiers, keys, or provisioning profiles.
