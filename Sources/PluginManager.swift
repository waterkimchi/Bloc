import Foundation

class PluginManager {
    private var plugins: [PluginProtocol] = []

    func loadPlugins() {
        plugins.append(Safari())
    }

    func getPlugin(for appName: String) -> PluginProtocol? {
        return plugins.first { $0.applicationName == appName }
    }

    func block(appName: String) throws {
        guard let plugin = getPlugin(for: appName) else {
            throw NSError(domain: "PluginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Plugin not found for \(appName)"])
        }
        try plugin.block()
    }

    func unblock(appName: String) throws {
        guard let plugin = getPlugin(for: appName) else {
            throw NSError(domain: "PluginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Plugin not found for \(appName)"])
        }
        try plugin.unblock()
    }

    func listPlugins() {
        print("Currently registered plugins:")
        for plugin in plugins {
            print("- \(plugin)")
        }
    }
}
