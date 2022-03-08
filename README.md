
# cordova-plugin-widget-center

**This plugin provides access to the WidgetCenter introduced in iOS14. Use it to retrieve information about widgets that extend your Cordova app or reload their timelines (i.e. update dynamic content)**

Installation:

```
cordova plugin add cordova-plugin-widget-center
```

This plugin was written in Swift and requires Cordova iOS 5.0.0+ or something like `cordova-plugin-add-swift-support` to properly build.

## Usage

For general advice, please refer to Apple's developer information on [WidgetCenter](https://developer.apple.com/documentation/widgetkit/widgetcenter) and [creating widgets](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension) in your Xcode project.

The following documentation is adapted to plugin use from the official docs for your convenience:

### Getting Configured Widget Information

To get a list of user-configured widgets, use [`WidgetCenter.getCurrentConfigurations()`](https://developer.apple.com/documentation/widgetkit/widgetcenter/getcurrentconfigurations(_:)). The return value contains the following information:

* The `kind` string matches the parameter you use when creating the widget's [`StaticConfiguration`](https://developer.apple.com/documentation/widgetkit/staticconfiguration) or [`IntentConfiguration`](https://developer.apple.com/documentation/widgetkit/intentconfiguration).

* The `family` property matches one of the options specified in the `supportedFamilies` property of the widget's configuration.

* If your widget is based on [`IntentConfiguration`](https://developer.apple.com/documentation/widgetkit/intentconfiguration), the `configuration` property provides the custom intent containing the user-customized values for each individual widget.

The return values are only concenated into a string in this version of the plugin.

```
WidgetCenter.getCurrentConfigurations(s=>console.log('Success:',s),e=>console.log('Error:',e))
```

### Requesting a Reload of Your Widget's Timeline

Changes in your app's state may affect a widget's timeline. When this happens, you can tell WidgetKit to reload the timeline for either a specific kind of widget or all widgets. For example, your app might register for push notifications based on the widgets the user has configured. When your app receives a push notification that changes the state for one or more of your widgets, requesting a reload of their timelines updates their display.

If you only need to reload a certain kind of widget, you can request a reload for only that kind. For example, in response to a push notification about a change in a game's status, you could request a reload for only the game status widgets:

```
WidgetCenter.reloadTimelines("com.mygame.gamestatus",s=>console.log('Success:',s),e=>console.log('Error:',e))
```

To request a reload for all of your widgets:

```
WidgetCenter.reloadAllTimelines(s=>console.log('Success:',s),e=>console.log('Error:',e))
```
