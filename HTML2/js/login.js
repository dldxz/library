function ajaxLogin(username, password) {
	$.ajax({
		url: 'login.php',
		method: 'post',
		data: {
			username: username,
			password: password
		},
		success: function(data) {
			if (data.status == 200) {
				localStorage.setItem('token', data.token)
				localStorage.setItem('type', data.types)
				cusAlert('info', '登录成功')
				setTimeout(function() {
				    location = 'query.html'
				}, 600)
			} else {
				cusAlert('dark', data.msg)
			}
		}
	})
}

var app
$(document).ready(function() {
	app = new Vue({
		el: '#interface',
		data: {
			username: '',
			password: ''
		},
		methods: {
			login: function() {
				if (this.username == '' || this.password == '') {
					return
				}
				ajaxLogin(this.username, this.password)
			}
		}
	})
})