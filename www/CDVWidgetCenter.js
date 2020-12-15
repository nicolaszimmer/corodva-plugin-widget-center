const exec = require('cordova/exec');
const PLUGIN_NAME = "CDVWidgetCenter";
var CDVWidgetCenter = function() {};
// Note: We are not passing any options in the [] block for this, so make sure you include the empty [] block.
CDVWidgetCenter.reloadAllTimelines = function(onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "reloadAllTimelines", []);
};
CDVWidgetCenter.reloadTimelines = function(kind, onSuccess, onError) {
	exec(onSuccess, onError, PLUGIN_NAME, "reloadAllTimelines", [kind]);
};
module.exports = CDVWidgetCenter;
