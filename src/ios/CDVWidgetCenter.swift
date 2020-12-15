@objc(CDVWidgetCenter) class CDVWidgetCenter : CDVPlugin {
  @objc(reloadAllTimelines:) // Declare your function name.
  func reloadAllTimelines(command: CDVInvokedUrlCommand) {

    let pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "The Plugin Failed");
    // Set the plugin result to succeed.
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "The plugin succeeded");
    // Send the function result back to Cordova.
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
		
  }
}
