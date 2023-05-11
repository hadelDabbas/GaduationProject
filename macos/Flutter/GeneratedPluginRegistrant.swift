//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import shared_preferences_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
=======
import rive_common
import shared_preferences_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  RivePlugin.register(with: registry.registrar(forPlugin: "RivePlugin"))
>>>>>>> aa176a0f05e1e86653e89d58d5f2d9d37591765f
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
}
