import Foundation
import WidgetKit

public class CDVWidgetCenter : CDVPlugin {

  @objc (reloadTimelines:)
  func reloadTimelines(command: CDVInvokedUrlCommand) {
    let kind = command.argument(at: 0) as! String?
    let pluginResult:CDVPluginResult
		let res = WidgetCenter.shared.reloadTimelines(ofKind kind)
		debugPrint(res)
    if res != nil {
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: res)
    } else {
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR)
    }

    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
  }

	@objc (reloadAllTimelines:)
	func reloadAllTimelines(command: CDVInvokedUrlCommand) {
		let pluginResult:CDVPluginResult
		 let res = WidgetCenter.shared.reloadAllTimelines()
		 debugPrint(res)
			if res != nil {
					pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: res)
			} else {
					pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR)
			}

		self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
	}

}
