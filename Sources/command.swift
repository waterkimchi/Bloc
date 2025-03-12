// The Swift Programming Language
// https://docs.swift.org/swift-book
import ArgumentParser

@main
struct Bloc: ParsableCommand {
  static let configuration = CommandConfiguration(
    abstract: "App to block unproductive apps",
    version: "0.0.1",
    subcommands: [
      Block.self,
      Unblock.self,
      List.self,
    ]
  )
}

struct Block: ParsableCommand {
  static let configuration = CommandConfiguration(
    abstract: "Block an application"
  )
  @Option(name: .shortAndLong, help: "Name of the application.")
  public var app: String

  func run() throws {
    let manager = PluginManager()
    try manager.block(appName: app)
    
  }
}

struct Unblock: ParsableCommand {
  static let configuration = CommandConfiguration(
    abstract: "unblock an application"
  )
  @Option(name: .shortAndLong, help: "Name of the application.")
  public var app: String
}

struct List: ParsableCommand {
  static let configuration = CommandConfiguration(
    abstract: "List all apps blocked."
  )
  func run() throws {
    let manager = PluginManager()
    manager.listPlugins()
  }
}
