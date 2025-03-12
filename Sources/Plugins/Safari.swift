import Foundation

struct Safari: PluginProtocol {
    let applicationName = "Safari"

    func block() throws {
        // Implement logic to block Safari (e.g., terminate processes)
        print("Blocking Safari...")
        // Call the process class to terminate safari.
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
        process.arguments = ["Safari"]

        do {
            try process.run()
            process.waitUntilExit()
            print("Killed Safari")
        } catch {
            print("Error killing Safari: \(error)")
        }

    }

    func unblock() throws {
        // Implement logic to unblock Safari (e.g., nothing, or restart)
        print("Unblocking Safari...")
    }
}
