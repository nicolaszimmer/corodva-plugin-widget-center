const exec = require('cordova/exec');
const PLUGIN_NAME = "WidgetCenter";

var WidgetCenter = function() {};
WidgetCenter.reloadAllTimelines = function(onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "reloadAllTimelines", []);
};
WidgetCenter.reloadTimelines = function(kind, onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "reloadAllTimelines", [kind]);
};
WidgetCenter.getCurrentConfigurations = function(onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "getCurrentConfigurations", []);
};
module.exports = WidgetCenter;
