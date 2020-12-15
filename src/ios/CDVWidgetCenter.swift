import Foundation
import WidgetKit

public class CDVWidgetCenter : CDVPlugin {

  func reloadTimelines(command: CDVInvokedUrlCommand) {
    let kind = command.argument(at: 0) as! String?
    let pluginResult:CDVPluginResult
		if #available(iOS 14, *) {
				WidgetCenter.shared.reloadTimelines(ofKind: kind)
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: res)
    } else {
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR)
    }

    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
  }

	func reloadAllTimelines(command: CDVInvokedUrlCommand) {
		let pluginResult:CDVPluginResult
		if #available(iOS 14, *) {
 					WidgetCenter.shared.reloadAllTimelines()
					pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: 'Done')
			} else {
					pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR)
			}
		self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
	}

}
