const exec = require('cordova/exec');
const PLUGIN_NAME = "WidgetCenter";
var WidgetCenter = function() {};
WidgetCenter.reloadAllTimelines = function(onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "reloadAllTimelines", []);
};
WidgetCenter.reloadTimelines = function(kind, onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "reloadAllTimelines", [kind]);
};
module.exports = WidgetCenter;
