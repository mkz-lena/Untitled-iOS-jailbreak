# Research status

Last updated: 2026-11-22

## Target
Operator-reported: iPhone 16e, iOS 27.0, build `24A5380h`. The operator reports MobileGestalt edits, so Settings labels are not authoritative. Exact hardware identifier and OS build remain unverified by this project.

The diagnostics app now reads:
- hardware identifier through `uname()`
- OS version through `ProcessInfo`
- kernel build through `sysctlbyname("kern.osversion")`

These are identification data, not exploit primitives.

## Reviewed material
### Calif: Endpoint Security on iOS 27.2 beta
The article compares iOS 27.0 build `24A437` with iOS 27.2 beta build `24B5084k`. It reports Endpoint Security kernel/userspace components in the beta and a research-mode gate that leaves the kernel component inactive on retail devices. This is platform research, not a jailbreak path.

**Build caveat:** `24A437` differs from the operator-reported `24A5380h`. Do not transfer offsets or binary conclusions across builds without a fresh comparison.

### Calif publications
The repository is a publication index covering MAD Bugs, Apple Internals, security research, and security audits. It is a methodology/reference index, not evidence of an exploit compatible with this target.

### worse_query and Erosion
Erosion describes itself as a customization toolbox based on `worse_query` and lists iOS 27.0 through 27.2.1 in its stated support range. That project claim does not establish kernel execution, a complete jailbreak, or reboot persistence on this exact device/build.

## Conclusion
No complete, independently verified exploit chain for the operator-reported iPhone 16e/build has been established. No exploit implementation is included. Current milestone: reliable target identification, reproducible diagnostics, and CI validation.

## Evidence labels
- Operator-reported: supplied by user, not independently verified.
- Source-reported: explicitly stated by a cited source.
- Verified locally: reproduced with recorded commands/output.
- Inference: plausible interpretation, not demonstrated fact.
