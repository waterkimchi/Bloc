import Foundation

protocol PluginProtocol {
    var applicationName: String { get }
    func block() throws
    func unblock() throws
}
