function parseJwt (token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace('-', '+').replace('_', '/');
    return JSON.parse(window.atob(base64));
};

function reload() {
    if (!islocalhost()) {
        setTimeout(function() {
            location.reload()
        }, 800)
    }
};

function cusAlert(type, content) {
	$('#alerts div').attr('class', 'alert alert-' + type)
		.html(content).css('display', 'block');
};