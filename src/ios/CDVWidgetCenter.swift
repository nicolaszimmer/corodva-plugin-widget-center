import Foundation
#if canImport(WidgetKit)
import WidgetKit
#endif

public class CDVWidgetCenter : CDVPlugin {

    @objc(reloadTimelines:)
    func reloadTimelines(command: CDVInvokedUrlCommand) {
        let kind = command.argument(at: 0) as! String
        var pluginResult:CDVPluginResult
        if #available(iOS 14, *) {
            WidgetCenter.shared.reloadTimelines(ofKind: kind)
            pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: "Timeline reloaded")
        } else {
            pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR, messageAs: "This plugin requires iOS 14 +")
        }

        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(reloadAllTimelines:)
    func reloadAllTimelines(command: CDVInvokedUrlCommand) {
        var pluginResult:CDVPluginResult
        if #available(iOS 14, *) {
            WidgetCenter.shared.reloadAllTimelines()
            pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: "All Timelines reloaded")
        } else {
            pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR, messageAs: "This plugin requires iOS 14 +")
        }
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(getCurrentConfigurations:)
    func getCurrentConfigurations(command: CDVInvokedUrlCommand) {
        if #available(iOS 14, *) {
            WidgetCenter.shared.getCurrentConfigurations { result in
                guard case .success(let widgets) = result else {
                    var pluginResult:CDVPluginResult
                    pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR, messageAs: "Unable to retrieve WidgetInfo")
                    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
                    return
                }
                var pluginResult:CDVPluginResult
                pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: String(reflecting: widgets))
                self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
            }
        } else {
            var pluginResult:CDVPluginResult
            pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR, messageAs: "This plugin requires iOS 14 +")
            self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }

}
