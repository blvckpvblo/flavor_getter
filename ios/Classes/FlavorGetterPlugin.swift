/*
 * FlavorGetterPlugin.kt
 * Flavor Getter Plugin
 *
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.2
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2023-06-21
 */

import Flutter
import UIKit

public class FlavorGetterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flavor_getter", binaryMessenger: registrar.messenger())
    let instance = FlavorGetterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getFlavor":
      var config: [String: Any]?

      if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
          do {
              let infoPlistData = try Data(contentsOf: infoPlistPath)
              
              if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                  config = dict
              }
          } catch {
              print(error)
          }
      }

      result(config?["FLAVOR"])
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
