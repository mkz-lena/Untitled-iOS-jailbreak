import Foundation
import Darwin

struct DeviceDiagnostics {
    let hardwareIdentifier: String
    let osVersion: String
    let kernelBuild: String

    static func collect() -> DeviceDiagnostics {
        var info = utsname()
        uname(&info)

        let machineField = info.machine
        let machineSize = MemoryLayout.size(ofValue: machineField)

        let machine = withUnsafePointer(to: machineField) { pointer in
            pointer.withMemoryRebound(to: CChar.self, capacity: machineSize) {
                String(cString: $0)
            }
        }

        return DeviceDiagnostics(
            hardwareIdentifier: machine,
            osVersion: ProcessInfo.processInfo.operatingSystemVersionString,
            kernelBuild: sysctlString("kern.osversion") ?? "Unavailable"
        )
    }

    private static func sysctlString(_ name: String) -> String? {
        var size = 0
        guard sysctlbyname(name, nil, &size, nil, 0) == 0, size > 1 else {
            return nil
        }

        var bytes = [CChar](repeating: 0, count: size)
        guard sysctlbyname(name, &bytes, &size, nil, 0) == 0 else {
            return nil
        }

        return String(cString: bytes)
    }
}
