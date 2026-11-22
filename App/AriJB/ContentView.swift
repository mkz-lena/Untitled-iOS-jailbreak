import SwiftUI

struct ContentView: View {
    private let diagnostics = DeviceDiagnostics.collect()

    var body: some View {
        NavigationStack {
            List {
                Section("Project") {
                    LabeledContent("Name", value: "AriJB")
                    LabeledContent("Version", value: "0.2.0-dev")
                    LabeledContent("State", value: "Diagnostics only")
                }
                Section("Device identity") {
                    LabeledContent("Hardware identifier", value: diagnostics.hardwareIdentifier)
                    LabeledContent("OS version", value: diagnostics.osVersion)
                    LabeledContent("Kernel build", value: diagnostics.kernelBuild)
                }
                Section("Scope") {
                    Text("Values are collected from system interfaces, not the Settings marketing name. These diagnostics do not establish exploit compatibility.")
                    Text("AriJB does not exploit the device, modify security settings, install a bootstrap, or claim jailbreak status.")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
            .navigationTitle("AriJB")
        }
    }
}
