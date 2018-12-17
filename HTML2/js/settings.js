var  __URL__ = 'http://localhost:8080/src/';
var __TOKEN__ = localStorage.getItem('token');
var __INFO__ = {};

if (__TOKEN__) {
	__INFO__ = parseJwt(__TOKEN__);
}

$.ajaxSetup({
    timeout: 10 * 60 * 1000,
    dataType: 'json',
    crossDomain: true,
    xhrFields: {
        withCredentials: true
    },
    headers: {
        Authorization: __TOKEN__
    }
});

$(document).ajaxSuccess(function(event, xhr, settings) {
	console.log(settings.url, xhr.responseJSON);
});

$(document).ajaxError(function(event, jqxhr, settings, thrownError) {
	console.log(event, jqxhr, settings, thrownError);
});

$.ajaxPrefilter(function(options) {
	var url = options.url;
	options.url = __URL__ + url;
});