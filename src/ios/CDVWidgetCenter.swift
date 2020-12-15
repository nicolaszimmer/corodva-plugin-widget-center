import WidgetKit

@objc(CDVWidgetCenter) class CDVWidgetCenter : CDVPlugin {
  @objc(reloadAllTimelines:) // Declare your function name.
  func reloadAllTimelines(command: CDVInvokedUrlCommand) {
    debugPrint(command)
    let pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "Plugin Failed");

    let res = WidgetCenter.shared.reloadAllTimelines()
    debugPrint(res)
    pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Plugin succeeded");
    // Send the function result back to Cordova.
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);

  }
}
